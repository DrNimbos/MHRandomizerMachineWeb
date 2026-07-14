extends Node

@onready var condi_hand: Node = $"../../condi_hand"

var _js_callback: JavaScriptObject


# ---------- EXPORTAR ----------

func exportar_desafios(desafios: Array[String]) -> void:
	var json_string = JSON.stringify(desafios, "\t")

	if OS.get_name() == "Web":
		var bytes = json_string.to_utf8_buffer()
		JavaScriptBridge.download_buffer(bytes, "desafios.json", "application/json")
	else:
		var file_dialog := FileDialog.new()
		file_dialog.file_mode = FileDialog.FILE_MODE_SAVE_FILE
		file_dialog.access = FileDialog.ACCESS_FILESYSTEM
		file_dialog.add_filter("*.json", "Arquivo JSON")
		file_dialog.file_selected.connect(func(caminho: String):
			var arquivo = FileAccess.open(caminho, FileAccess.WRITE)
			if arquivo:
				arquivo.store_string(json_string)
				arquivo.close()
			file_dialog.queue_free()
		)
		file_dialog.canceled.connect(file_dialog.queue_free)
		add_child(file_dialog)
		file_dialog.popup_centered(Vector2i(600, 400))


# ---------- IMPORTAR ----------

func importar_desafios() -> void:
	if OS.get_name() == "Web":
		_abrir_seletor_arquivo_web()
	else:
		var file_dialog := FileDialog.new()
		file_dialog.file_mode = FileDialog.FILE_MODE_OPEN_FILE
		file_dialog.access = FileDialog.ACCESS_FILESYSTEM
		file_dialog.add_filter("*.json", "Arquivo JSON")
		file_dialog.file_selected.connect(_on_arquivo_selecionado_desktop)
		file_dialog.canceled.connect(file_dialog.queue_free)
		add_child(file_dialog)
		file_dialog.popup_centered(Vector2i(600, 400))


func _abrir_seletor_arquivo_web() -> void:
	_js_callback = JavaScriptBridge.create_callback(_on_arquivo_lido_web)
	JavaScriptBridge.eval("""
		var input = document.createElement('input');
		input.type = 'file';
		input.accept = '.json';
		input.onchange = function(e) {
			var file = e.target.files[0];
			var reader = new FileReader();
			reader.onload = function(evt) {
				window.godotFileCallback(evt.target.result);
			};
			reader.readAsText(file);
		};
		input.click();
	""", true)
	JavaScriptBridge.get_interface("window").godotFileCallback = _js_callback


func _on_arquivo_lido_web(args: Array) -> void:
	var conteudo = args[0]
	_processar_json(conteudo)


func _on_arquivo_selecionado_desktop(caminho: String) -> void:
	var arquivo = FileAccess.open(caminho, FileAccess.READ)
	if arquivo == null:
		print("Erro ao abrir arquivo: ", FileAccess.get_open_error())
		return
	var conteudo = arquivo.get_as_text()
	arquivo.close()
	_processar_json(conteudo)


# ---------- COMUM ----------

func _processar_json(conteudo: String) -> void:
	var json = JSON.new()
	if json.parse(conteudo) == OK and json.data is Array:
		for item in json.data:
			var texto = str(item)
			if texto not in condi_hand.l_condi:
				condi_hand.adicionacond(texto)
	else:
		print("Erro ao importar: JSON inválido")


# ---------- BOTÕES ----------

func _on_carregar_pressed() -> void:
	importar_desafios()

func _on_salvar_pressed() -> void:
	exportar_desafios(condi_hand.l_condi)

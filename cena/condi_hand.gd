extends Node

@export var l_condi:Array[String]

@onready var inserir: LineEdit = $"../condicoes/Inserir"
@onready var condi_list: VBoxContainer = $"../condicoes/condições/condi_list"
const LINE_EDIT_TEMA = preload("uid://che4u2xnx1qvo")


func _ready() -> void:
	adicionacond("em até 5 minutos")
	adicionacond("com uma mão no controle")
	adicionacond("sem tomar hit")
	adicionacond("sem usar items")
	adicionacond("quebrando todas as partes em até 4 minutos")
	adicionacond("em até 10 minutos")
	adicionacond("usando equipamento low rank")
	adicionacond("sem nenhuma armadura")
	adicionacond("sem stamina")
	
	

func _on_inserir_text_submitted(new_text: String) -> void:
	if new_text.strip_edges() != "":
		print(new_text)
		adicionacond(new_text)
		inserir.clear()


func adicionacond(condi:String):
	l_condi.append(condi)
	var btn = Button.new()
	btn.text = condi
	btn.pressed.connect(_on_button_pressed.bind(btn))
	btn.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	btn.theme = LINE_EDIT_TEMA
	condi_list.add_child(btn)
	
func _on_button_pressed(btn: Button):
	var nome_condi = btn.text
	l_condi.erase(nome_condi)
	btn.queue_free()

extends Node


@export var list_mon:Array[Monster]
@export var list_mon_apex:Array[Monster]
@export var list_mon_hyper:Array[Monster]
@export var list_mon_afflicted:Array[Monster]
@export var list_mon_deviant:Array[Monster]
@export var list_mon_Musou:Array[Monster]
@export var list_mon_Zenith:Array[Monster]
@export var list_mon_roll:Array[Monster]

#@onready var v_box_container: VBoxContainer = $"../monsti/Lista Monstros/VBoxContainer"
#@onready var v_box_container: GridContainer = $"../Lista Monstros/VBoxContainer"
@onready var v_box_container: GridContainer = $"../monsti/Lista Monstros/VBoxContainer"
const CHECKBOX_MONSTERS = preload("uid://lyfsbtiils4o")




func _ready() -> void:
	if list_mon.is_empty():
		pass
	else:
		for i in list_mon:
			var montro_nom = i.nome
			var montro_icon = i.foto
			var checkbox = CheckBox.new()
			checkbox.text = montro_nom
			checkbox.icon = montro_icon
			#checkbox.text_overrun_behavior = TextServer.OVERRUN_TRIM_WORD_ELLIPSIS
			#checkbox.expand_icon = true
			checkbox.toggled.connect(_on_check_box_toggled.bind(i))
			checkbox.theme = CHECKBOX_MONSTERS
			checkbox.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			checkbox.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
			checkbox.custom_minimum_size.x = 300
			v_box_container.add_child(checkbox)
			print(montro_nom)

func _on_check_box_toggled(toggled_on: bool, monster: Monster) -> void:
	if toggled_on:
		if not list_mon_roll.has(monster):
			list_mon_roll.append(monster)
	else:
		list_mon_roll.erase(monster)
		
func marcar_todos(valor: bool):
	for child in v_box_container.get_children():
		if child is CheckBox:
			child.button_pressed = valor





func _on_ativar_pressed() -> void:
	marcar_todos(true)


func _on_desativar_pressed() -> void:
	marcar_todos(false)




func Filter(nome: String):
	var termo = nome.strip_edges()
	for child in v_box_container.get_children():
		if child is CheckBox:
			if termo == "":
				child.visible = true
			else:
				# findn() ignora maiúsculas/minúsculas
				child.visible = child.text.findn(termo) != -1


func _on_line_edit_text_changed(new_text: String) -> void:
	Filter(new_text)

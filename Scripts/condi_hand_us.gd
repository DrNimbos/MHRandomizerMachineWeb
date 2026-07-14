extends Node

@export var l_condi:Array[String]

@onready var inserir: LineEdit = $"../condicoes/Inserir"
@onready var condi_list: VBoxContainer = $"../condicoes/condições/condi_list"
const LINE_EDIT_TEMA = preload("uid://che4u2xnx1qvo")


func _ready() -> void:
	adicionacond("in just 5 minutes")
	adicionacond("with just one hand on the controller")
	adicionacond("with no hits taken")
	adicionacond("with no items")
	adicionacond("while breaking all parts in 4 minutes")
	adicionacond("in just 10 minutes")
	adicionacond("while using low rank equipment")
	adicionacond("without armor")
	adicionacond("without stamina")
	
	

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

extends Node2D

#@export var l_Monstros:Array[Monster]
@export var MC:Array[String]
@export var tempp:Array[String]

var MH_FRONTIER_AURISIOTH_ICON = load("res://Foto/integoracao/MHFrontier-Aurisioth_Icon.png")
var SELECT_US = preload("res://cena/select.tscn")

@onready var node: Node = $Node
@onready var condi_hand: Node = $condi_hand
@onready var mons_hand: Node = $mons_hand
@onready var dialog: RichTextLabel = $Luna/dialog
@onready var label: Label = $Background/Label
@onready var sprite_2d: Sprite2D = $Background/Sprite2D
@export var can_capture:bool = true
@export var only_tempered:bool = false
@export var only_A_tempered:bool = false
@export var disable_tempered:bool = false
@export var only_apex:bool = false
@export var only_hyper:bool = false
@export var only_afflicted:bool = false
@export var only_musou:bool = false
@export var only_Zenith:bool = false
@onready var sino_2: AnimatedSprite2D = $Area2D/sino2
@onready var sino: AnimatedSprite2D = $Area2D/sino

@onready var plush: AudioStreamPlayer = $Plush
@onready var sino_som: AudioStreamPlayer = $Sino
@onready var quest: AudioStreamPlayer = $quest
@onready var gear: AudioStreamPlayer = $gear


@onready var animated_sprite_2d: AnimatedSprite2D = $Luna/AnimatedSprite2D
@onready var back: AnimationPlayer = $back

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var timer_2 := Timer.new()
@onready var timer_sino := Timer.new()
@onready var timer_botao := Timer.new()

var streak = 0

func _ready():
	timer_2.one_shot = true
	add_child(timer_2)
	timer_2.timeout.connect(resetsprite)
	timer_sino.one_shot = true
	add_child(timer_sino)
	timer_sino.timeout.connect(resetsprite_sino)
	timer_botao.one_shot = true
	add_child(timer_botao)
	timer_botao.timeout.connect(resetspritebotao)
	dialog.start_typing_effect("Hi Hunter! My name is Luna. I'm a former Guild Receptionist and a researcher. To activate the machine, ring the bell on the desk!")
	trocarsprite("1")

func sino_apertado(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			sino_anim()
			sino_som.play()
			if node.lista_arma.is_empty():
				sprite_2d.texture = MH_FRONTIER_AURISIOTH_ICON
				mensagem("NO WEAPON SELECTED")
			elif mons_hand.list_mon_roll.is_empty():
				sprite_2d.texture = MH_FRONTIER_AURISIOTH_ICON
				mensagem("NO MONSTER SELECTED")
			else:
				rolar()


func rolar():
	back.play("roll")
	quest.play()
	gear.play()
	var temp:String
	var esp_temp:String = ""
	var arma_selecionado = node.lista_arma.pick_random()
	var MC_R:String
	var monstro_selecionado = mons_hand.list_mon_roll.pick_random()
	if only_apex:
		monstro_selecionado = mons_hand.list_mon_apex.pick_random()
		esp_temp = "Apex"
	elif only_hyper:
		monstro_selecionado = mons_hand.list_mon_deviant.pick_random()
		esp_temp = "Deviant"
	elif only_afflicted:
		monstro_selecionado = mons_hand.list_mon_afflicted.pick_random()
		esp_temp = "Afflicted"
	elif only_Zenith:
		monstro_selecionado = mons_hand.list_mon_Zenith.pick_random()
		esp_temp = "Zenith"
	elif only_musou:
		monstro_selecionado = mons_hand.list_mon_Musou.pick_random()
		esp_temp = "Musou"
		
		
	if can_capture == true and monstro_selecionado.capturavel == true:
		MC_R = MC.pick_random()
	else:
		MC_R = "Slay"
		
	if only_tempered and only_A_tempered:
		temp = tempp.pick_random()
	elif only_tempered ==true:
		temp = "Tempered"
	elif only_A_tempered ==true:
		temp = "Arch-Tempered"
	elif monstro_selecionado.tempered and monstro_selecionado.a_tempered:
		temp = tempp.pick_random()
	
	if condi_hand.l_condi.is_empty():
		if esp_temp != "":
			label.text = MC_R + " " + esp_temp +" " + monstro_selecionado.nome + " with " + arma_selecionado
			dialog.start_typing_effect(monstro_selecionado.comentario2)
			trocarsprite(String(monstro_selecionado.reacao))
		elif disable_tempered == true or monstro_selecionado.tempered ==false and monstro_selecionado.a_tempered == false:
			label.text = MC_R + " " + monstro_selecionado.nome + " with " + arma_selecionado
			dialog.start_typing_effect(monstro_selecionado.comentario2)
			trocarsprite(String(monstro_selecionado.reacao))
		else:
			label.text = MC_R + " " + temp +" " + monstro_selecionado.nome + " with " + arma_selecionado
			dialog.start_typing_effect(monstro_selecionado.comentario2)
			trocarsprite(String(monstro_selecionado.reacao))

	else:
		var condicao = condi_hand.l_condi.pick_random()
		if esp_temp != "":
			label.text = MC_R + " " + esp_temp +" " + monstro_selecionado.nome + " with " + arma_selecionado
			dialog.start_typing_effect(monstro_selecionado.comentario2)
			trocarsprite(String(monstro_selecionado.reacao))
		elif disable_tempered == true or monstro_selecionado.tempered ==false and monstro_selecionado.a_tempered == false:
			label.text = MC_R + " " + monstro_selecionado.nome + " with " + arma_selecionado + " " + condicao
			dialog.start_typing_effect(monstro_selecionado.comentario2)
			trocarsprite(String(monstro_selecionado.reacao))
		else:
			label.text = MC_R + " " + temp +" " + monstro_selecionado.nome + " with " + arma_selecionado + " " + condicao
			dialog.start_typing_effect(monstro_selecionado.comentario2)
			trocarsprite(String(monstro_selecionado.reacao))
		
	sprite_2d.texture = monstro_selecionado.foto

func trocarsprite(frame: String) -> void:
	timer_2.stop()
	animation_player.play("jump")
	animated_sprite_2d.play(frame)
	timer_2.start(8)

func resetsprite():
	animated_sprite_2d.play("0")
func resetsprite_sino():
	sino.play("default")
	sino_2.play("default")
func resetspritebotao():
	$sucess/bot2.play("default")
	$sucess/bot3.play("default")
func blush(frame: String) -> void:
	plush.play()
	timer_2.stop()
	animation_player.play("jump")
	animated_sprite_2d.play(frame)
	timer_2.start(1)

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			blush("6")

func sino_anim() -> void:
	timer_sino.stop()
	sino.play("1")
	sino_2.play("1")
	
	timer_sino.start(0.1)
	


func mensagem(men:String):
	back.play("roll")
	label.text = men


func _on_area_2d_mouse_shape_entered(shape_idx: int) -> void:
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	$Area2D/sino3.show()
	


func _on_area_2d_mouse_shape_exited(shape_idx: int) -> void:
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	$Area2D/sino3.hide()


func _on_disable_tempereds_toggled(toggled_on: bool) -> void:
	disable_tempered = toggled_on


func _on_only_tempered_toggled(toggled_on: bool) -> void:
	only_tempered = toggled_on


func _on_only_arch_tempered_toggled(toggled_on: bool) -> void:
	only_A_tempered = toggled_on


func _on_only_apex_toggled(toggled_on: bool) -> void:
	only_apex = toggled_on


func _on_only_hyper_toggled(toggled_on: bool) -> void:
	only_hyper = toggled_on


func _on_only_afflicted_toggled(toggled_on: bool) -> void:
	only_afflicted = toggled_on


func _on_only_zenith_toggled(toggled_on: bool) -> void:
	only_Zenith = toggled_on

func _on_only_musou_toggled(toggled_on: bool) -> void:
	only_musou = toggled_on


func _on_enable_capture_toggled(toggled_on: bool) -> void:
	can_capture = toggled_on


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_packed(SELECT_US)

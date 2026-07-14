extends Node


@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
@onready var cond_list_: Button = $cond_list_
@onready var close_cond_list: Button = $close_cond_list
@onready var monst_list: Button = $monst_list
@onready var monst_list_close: Button = $monst_list_close
@onready var arma_list: Button = $arma_list
@onready var arma_list_close: Button = $arma_list_close
@onready var ativar: Button = $ativar
@onready var desativar: Button = $desativar
@onready var v_box_container_2: GridContainer = $"../weapon/VBoxContainer2"
@onready var sprite_2d: Sprite2D = $"../monsti/Sprite2D"
@onready var settings_close: Button = $settings_close
@onready var settings: Button = $settings
@onready var menu: Button = $menu
@onready var monstros: AudioStreamPlayer = $"../Monstros"
@onready var armas: AudioStreamPlayer = $"../Armas"
@onready var config: AudioStreamPlayer = $"../Config"
@onready var condi: AudioStreamPlayer = $"../Condi"

func _ready() -> void:
	animation_player.play("monst_list_stay")
func _on_cond_list__pressed() -> void:
	condi.play()
	cond_list_.visible = false
	animation_player.play("condi_list_open")
	await animation_player.animation_finished
	close_cond_list.visible = true


func _on_close_cond_list_pressed() -> void:
	condi.play()
	close_cond_list.visible = false
	animation_player.play("condi_list_close")
	await animation_player.animation_finished
	cond_list_.visible = true


func _on_monst_list_pressed() -> void:
	monstros.play()
	print("aaa")
	sprite_2d.show()
	monst_list.visible = false
	animation_player.play("monst_list_open")
	await animation_player.animation_finished
	monst_list_close.visible = true
	ativar.show()
	desativar.show()
	$filter.show()


func _on_monst_list_close_pressed() -> void:
	monstros.play()
	monst_list_close.visible = false
	ativar.hide()
	desativar.hide()
	$filter.hide()
	animation_player.play("monst_list_close")
	await animation_player.animation_finished
	sprite_2d.hide()
	monst_list.visible = true




func _on_arma_list_pressed() -> void:
	armas.play()
	arma_list.hide()
	animation_player.play("weapon_list_open")
	await animation_player.animation_finished
	arma_list_close.show()
	$ativar_ar.show()
	$desativar_ar.show()

func _on_arma_list_close_pressed() -> void:
	armas.play()
	arma_list_close.hide()
	$ativar_ar.hide()
	$desativar_ar.hide()
	animation_player.play("weapon_list_close")
	await animation_player.animation_finished
	arma_list.show()
func marcar_todos(valor: bool):
	for child in v_box_container_2.get_children():
		if child is CheckBox:
			if child.visible:
				child.button_pressed = valor


func _on_ativar_ar_pressed() -> void:
	marcar_todos(true)


func _on_desativar_ar_pressed() -> void:
	marcar_todos(false)


func _on_settings_close_pressed() -> void:
	config.play()
	settings_close.hide()
	animation_player.play("setting_close")
	await animation_player.animation_finished
	settings.show()


func _on_settings_toggled() -> void:
	config.play()
	settings.hide()
	animation_player.play("setting_open")
	await animation_player.animation_finished
	settings_close.show()

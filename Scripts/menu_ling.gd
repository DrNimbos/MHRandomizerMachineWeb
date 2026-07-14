extends Node2D

var SELECT_BR = load("res://cena/select_br.tscn")
var SELECT_US = load("res://cena/select.tscn")



func _on_portugues_pressed() -> void:
	get_tree().change_scene_to_packed(SELECT_BR)


func _on_english_pressed() -> void:
	get_tree().change_scene_to_packed(SELECT_US)

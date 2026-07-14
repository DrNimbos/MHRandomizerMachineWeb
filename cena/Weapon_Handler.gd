extends Node

@onready var node_2d: Node2D = $".."

@export var lista_arma:Array[String]



func _on_check_box_toggled(toggled_on: bool) -> void:
	if not toggled_on:
		lista_arma.erase("Greatsword")
	else:
		lista_arma.append("Greatsword")


func _on_check_box_2_toggled(toggled_on: bool) -> void:
	if not toggled_on:
		lista_arma.erase("Hammer")
	else:
		lista_arma.append("Hammer")


func _on_check_box_3_toggled(toggled_on: bool) -> void:
	if not toggled_on:
		lista_arma.erase("Sword and Shield")
	else:
		lista_arma.append("Sword and Shield")


func _on_check_box_4_toggled(toggled_on: bool) -> void:
	if not toggled_on:
		lista_arma.erase("Dual Blades")
	else:
		lista_arma.append("Dual Blades")


func _on_check_box_5_toggled(toggled_on: bool) -> void:
	if not toggled_on:
		lista_arma.erase("Lance")
	else:
		lista_arma.append("Lance")


func _on_check_box_6_toggled(toggled_on: bool) -> void:
	if not toggled_on:
		lista_arma.erase("Heavy Bowgun")
	else:
		lista_arma.append("Heavy Bowgun")


func _on_check_box_7_toggled(toggled_on: bool) -> void:
	if not toggled_on:
		lista_arma.erase("Light Bowgun")
	else:
		lista_arma.append("Light Bowgun")


func _on_longsword_toggled(toggled_on: bool) -> void:
	if not toggled_on:
		lista_arma.erase("Longsword")
	else:
		lista_arma.append("Longsword")


func _on_gunlance_toggled(toggled_on: bool) -> void:
	if not toggled_on:
		lista_arma.erase("Gunlance")
	else:
		lista_arma.append("Gunlance")


func _on_hunting_horn_toggled(toggled_on: bool) -> void:
	if not toggled_on:
		lista_arma.erase("Hunting Horn")
	else:
		lista_arma.append("Hunting Horn")


func _on_insect_glaive_toggled(toggled_on: bool) -> void:
	if not toggled_on:
		lista_arma.erase("Insect Glaive")
	else:
		lista_arma.append("Insect Glaive")


func _on_charge_blade_toggled(toggled_on: bool) -> void:
	if not toggled_on:
		lista_arma.erase("Charge Blade")
	else:
		lista_arma.append("Charge Blade")


func _on_bow_toggled(toggled_on: bool) -> void:
	if not toggled_on:
		lista_arma.erase("Bow")
	else:
		lista_arma.append("Bow")


func _on_tonfa_toggled(toggled_on: bool) -> void:
	if not toggled_on:
		lista_arma.erase("Tonfa")
	else:
		lista_arma.append("Tonfa")


func _on_magnet_spike_toggled(toggled_on: bool) -> void:
	if not toggled_on:
		lista_arma.erase("Magnet Spike")
	else:
		lista_arma.append("Magnet Spike")


func _on_switch_axe_toggled(toggled_on: bool) -> void:
	if not toggled_on:
		lista_arma.erase("Switch Axe")
	else:
		lista_arma.append("Switch Axe")


func _on_medium_bowgun_toggled(toggled_on: bool) -> void:
	if not toggled_on:
		lista_arma.erase("Medium Bowgun")
	else:
		lista_arma.append("Medium Bowgun")


func _on_medium_bowgun_pressed() -> void:
	pass # Replace with function body.

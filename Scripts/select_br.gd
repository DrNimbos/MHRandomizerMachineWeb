extends Node2D

var MH_1JP_BR = load("res://cena/MH1JP_BR.tscn")
var MH_1US_BR = load("res://cena/MH1US_BR.tscn")
var MH_2_BR = load("res://cena/MH2_BR.tscn")
var MH_3U_BR = load("res://cena/MH3U_BR.tscn")
var MH_3_BR = load("res://cena/MH3_BR.tscn")
var MH_4U_BR = load("res://cena/MH4U_BR.tscn")
var MH_4_BR = load("res://cena/MH4_BR.tscn")
var MH_FRONTIER_BR = load("res://cena/MHFrontier_BR.tscn")
var MHGU_BR = load("res://cena/MHGU_BR.tscn")
var MHG_BR = load("res://cena/MHG_BR.tscn")
var MHP_1_BR = load("res://cena/MHP1_BR.tscn")
var MHP_2G_BR = load("res://cena/MHP2G_BR.tscn")
var MHP_2_BR = load("res://cena/MHP2_BR.tscn")
var MHP_3_BR = load("res://cena/MHP3_BR.tscn")
var MHRS_BR = load("res://cena/MHRS_BR.tscn")
var MHR_BR = load("res://cena/MHR_BR.tscn")
var MH_WILDS_BR = load("res://cena/MHWilds_BR.tscn")
var MHWI_BR = load("res://cena/MHWI_BR.tscn")
var MHW_BR = load("res://cena/MHW_BR.tscn")
var CUSTOM_BR = load("res://cena/custom_BR.tscn")
var MH_1G_BR = load("res://cena/MH1G_BR.tscn")





func _on_mh_1jp_pressed() -> void:
	get_tree().change_scene_to_packed(MH_1JP_BR)


func _on_mh_1us_pressed() -> void:
	get_tree().change_scene_to_packed(MH_1US_BR)


func _on_mh_11g_pressed() -> void:
	get_tree().change_scene_to_packed(MH_1G_BR)


func _on_m_hfreedom_pressed() -> void:
	get_tree().change_scene_to_packed(MHP_1_BR)


func _on_mh_2_pressed() -> void:
	get_tree().change_scene_to_packed(MH_2_BR)


func _on_mhp_2_pressed() -> void:
	get_tree().change_scene_to_packed(MHP_2_BR)


func _on_mhpg_pressed() -> void:
	get_tree().change_scene_to_packed(MHP_2G_BR)


func _on_mh_3_pressed() -> void:
	get_tree().change_scene_to_packed(MH_3_BR)


func _on_mh_3u_pressed() -> void:
	get_tree().change_scene_to_packed(MH_3U_BR)


func _on_mhp_3_pressed() -> void:
	get_tree().change_scene_to_packed(MHP_3_BR)


func _on_mh_4_pressed() -> void:
	get_tree().change_scene_to_packed(MH_4_BR)


func _on_mh_4u_pressed() -> void:
	get_tree().change_scene_to_packed(MH_4U_BR)


func _on_mh_gen_pressed() -> void:
	get_tree().change_scene_to_packed(MHG_BR)


func _on_mhgu_pressed() -> void:
	get_tree().change_scene_to_packed(MHGU_BR)


func _on_mhw_pressed() -> void:
	get_tree().change_scene_to_packed(MHW_BR)


func _on_mh_wi_pressed() -> void:
	get_tree().change_scene_to_packed(MHWI_BR)


func _on_mhr_pressed() -> void:
	get_tree().change_scene_to_packed(MHR_BR)


func _on_mhrs_pressed() -> void:
	get_tree().change_scene_to_packed(MHRS_BR)


func _on_mhfzz_pressed() -> void:
	get_tree().change_scene_to_packed(MH_FRONTIER_BR)


func _on_custom_pressed() -> void:
	get_tree().change_scene_to_packed(CUSTOM_BR)


func _on_m_hwilds_pressed() -> void:
	get_tree().change_scene_to_packed(MH_WILDS_BR)


func _on_download_pressed() -> void:
	if OS.has_feature("web"):
		JavaScriptBridge.eval("window.open('https://drive.google.com/file/d/1DctITkmQccohQXaeVqUFrMywNbgHcFM-/view?usp=sharing', '_blank').focus();")
	else:
		OS.shell_open("https://drive.google.com/file/d/1DctITkmQccohQXaeVqUFrMywNbgHcFM-/view?usp=sharing")


func _on_site_pressed() -> void:
	if OS.has_feature("web"):
		JavaScriptBridge.eval("window.open('https://drnimbos.github.io/', '_blank').focus();")
	else:
		OS.shell_open("https://drnimbos.github.io/")

extends Node2D

@onready var label: Label = $Label
var texto_com = ''
var estadotrue = false
var condicaonew = []
@onready var lineedit: LineEdit = $VBoxContainer/Lineedit
@onready var line_editremover: LineEdit = $VBoxContainer/LineEdit
var arma = []


func _ready() -> void:
	$Sprite2D/AnimationPlayer.play("new_animation")
func _on_button_pressed() -> void:
	#randomizar as coisas
	var desafio = ["Matar um", "Capturar um",]
	var monstro = ["Ancient Leshen",
			   "Anjanath",
			   "Fulgur Anjanath",
			   "Barroth",
			   "Bazelgeuse",
			   "Behemoth",
			   "Deviljho",
			   "Great Jagras",
			   "Diablos",
			   "Kulu-Ya-Ku",
			   "Pukei-Pukei",
			   "Jyuratodus",
			   "Tobi-Kadachi",
			   "Rathian",
			   "Gold Rathian",
			   "Pink Rathian",
			   "Rathalos",
			   "Silver Rathalos",
			   "Azure Rathalos",
			   "Tzitzi-Ya-Ku",
			   "Paolumu",
			   "Great Girros",
			   "Radobaan",
			   "Legiana",
			   "Shrieking Legiana",
			   "Ebony Odogaron",
			   "Black Diablos",
			   "Dodogama",
			   "Zorah Magdaros",
			   "Lavasioth",
			   "Uragaan",
			   "Kirin",
			   "Nergigante",
			   "Teostra",
			   "Kushala Daora",
			   "Vaal Hazaak",
			   "Lunastra",
			   "Xeno Jii'va",
			   "Kulve Taroth",
			   "Leshen",
			   "Beotodus",
			   "Banbaro",
			   "Viper Tobi Kadachi",
			   "Nightshade Paolumu",
			   "Coral Pukei-Pukei",
			   "Barioth",
			   "Nargacuga",
			   "Glavenus",
			   "Tigrex",
			   "Brachydios",
			   "Velkhana",
			   "Acidic Glavenus",
			   "Seething Bazelgeuse",
			   "Blackveil Vaal Haazak",
			   "Namielle",
			   "Savage Deviljho",
			   "Ruiner Nergigante",
			   "Shara Ishvalda",
			   "Zinogre",
			   "Raging Brachydios",
			   "Stygian Zinogre",
			   "Yian Garuga",
			   "Scarred Yian Garuga",
			   "Brute Tigrex",
			   "Rajang",
			   "Furious Rajang",
			   "Safi Jii'va",
			   "Frostfang Barioth",
			   "Alatron",
			   "Fatalis",
			   ]
	var condicao = ["em 10 minutos",
				"com uma arma não upada",
				"sem armadura",
				"sem comer",
				"sem mover a Camera",
				"sem correr",
				"sem rolar",
				"em 15 minutos quebrando TODAS as partes (possiveis)"
				]
	var estado = ["Aguerrido", "Normal"]
	var esc1 = arma.pick_random()
	if esc1 in ["Lance", "Gunlance"]:
		condicao.append("Sem defender")
	if esc1 == null:
		esc1 = "NENHUMA ARMA ESCOLHIDA"
	var esc2 = monstro.pick_random()
	if esc2 in ["Nergigante", "Ruiner Nergigante", "Behemoth", "Leshen", "Ancient Leshen", "Teostra", "Lunastra", "Vaal Haazak","Blackveil Vaal Haazak", "Zorah Magdaros", "Kushala Daora", "Xeno Jii'va", "Safi Jii'va", "Raging Brachydios", "Alatreon","Fatalis"]:
		desafio.pop_at(1)
	if esc2 in ["Nergigante",'Kulve Taroth',"Xeno Jii'va","Zorah Magdaros", "Lunastra", "Kushala Daora", "Teostra", "Vaal Hazaak", "Kirin", "Velkhana","Namielle"]:
		estado.append("Arqui Aguerrido")
	if esc2 in ["Fatalis", "Alatreon", "Raging Brachydios", "Zorah Magdaros", "Xeno Jii'va", "Kulve Taroth", "Safi Jii'va","Shara Ishvalda"]:
		estado.pop_at(0)
	var esc3 = desafio.pick_random()
	var esc4 = condicao.pick_random()
	# Se houver itens extras definidos pelo usuário
	if condicaonew.size() > 0:
	# Cria uma lista temporária com condicao original + 1 item aleatório do condicaonew
		var temp_condicoes = condicao.duplicate()
		temp_condicoes.append(condicaonew.pick_random())
		esc4 = temp_condicoes.pick_random()
	else:
	# Usa condicao normal
		esc4 = condicao.pick_random()
	var esc5 = estado.pick_random()
	
	
	
	if estadotrue == true:
		label.text = esc3+ " " + esc2 + " " + esc5 +" com "+esc1+ " "+ esc4
	else:
		label.text = esc3+ " " + esc2 +" com "+esc1+ " "+ esc4

func _on_check_box_toggled(toggled_on: bool) -> void:
	if toggled_on:
		estadotrue = true
	else:
		estadotrue = false


func _on_text_edit_text_submitted(new_text: String) -> void:
	if new_text.strip_edges() != "":
		condicaonew.append(new_text.strip_edges())
		lineedit.clear()
		$VBoxContainer/TextEdit2.text = "\n".join(condicaonew)
		print(condicaonew)


func _on_line_edit_text_submitted(_new_text: String) -> void:
	var texto_remover = line_editremover.text.strip_edges()
	
	if texto_remover == "":
		print("deubosta")
		return
	if texto_remover in condicaonew:
		condicaonew.erase(texto_remover)
		print("Removido:", texto_remover)
	else:
		print("deubosta2")
	$VBoxContainer/TextEdit2.text = "\n".join(condicaonew)
	line_editremover.clear()


func _on_greatsword_toggled(toggled_on: bool) -> void:
	if toggled_on:
		arma.append("Greatsword")
	else:
		arma.erase("Greatsword")

func _on_longsword_toggled(toggled_on: bool) -> void:
	if toggled_on:
		arma.append("Longsword")
	else:
		arma.erase("Longsword")
		
func _on_sword__shield_toggled(toggled_on: bool) -> void:
	if toggled_on:
		arma.append("Sword & Shield")
	else:
		arma.erase("Sword & Shield")

func _on_dual_blades_toggled(toggled_on: bool) -> void:
	if toggled_on:
		arma.append("Dual Blades")
	else:
		arma.erase("Dualblades")

func _on_hammer_toggled(toggled_on: bool) -> void:
	if toggled_on:
		arma.append("Hammer")
	else:
		arma.erase("Hammer")

func _on_hunting_horn_toggled(toggled_on: bool) -> void:
	if toggled_on:
		arma.append("Hunting Horn")
	else:
		arma.erase("Hunting Horn")

func _on_lance_toggled(toggled_on: bool) -> void:
	if toggled_on:
		arma.append("Lance")
	else:
		arma.erase("Lance")

func _on_gunlance_toggled(toggled_on: bool) -> void:
	if toggled_on:
		arma.append("Gunlance")
	else:
		arma.erase("Gunlance")

func _on_switch_axe_toggled(toggled_on: bool) -> void:
	if toggled_on:
		arma.append("Switch Axe")
	else:
		arma.erase("Switch Axe")

func _on_charge_blade_toggled(toggled_on: bool) -> void:
	if toggled_on:
		arma.append("Charge Blade")
	else:
		arma.erase("Charge Blade")

func _on_insect_glaive_toggled(toggled_on: bool) -> void:
	if toggled_on:
		arma.append("Insect Glaive")
	else:
		arma.erase("Insect Glaive")

func _on_bow_toggled(toggled_on: bool) -> void:
	if toggled_on:
		arma.append("Bow")
	else:
		arma.erase("Bow")

func _on_light_bowgun_toggled(toggled_on: bool) -> void:
	if toggled_on:
		arma.append("Light Bow")
	else:
		arma.erase("Light Bow")

func _on_heavy_bowgun_toggled(toggled_on: bool) -> void:
	if toggled_on:
		arma.append("Heavy Bow")
	else:
		arma.erase("Heavy Bow")

extends Resource
class_name Monster


@export var nome:String
@export var foto = Texture2D
@export var tempered:bool
@export var a_tempered:bool
@export var apex:bool
@export var hyper:bool
@export var afflicted:bool
@export var capturavel:bool
@export var tipo: types

@export var comentario2:String
@export var comentario2_br:String
@export var reacao:String = "1"

enum types{
	Amphibian,
	Bird_Wyvern,
	Brute_Wyvern,
	Flying_Wyvern,
	Carapaceon,
	Cephalopod,
	Construct,
	Demi_Elder,
	Elder_Dragon,
	Fanged_Beast,
	Fanged_Wyvern,
	Interogation,
	Leviathan,
	Neopteron,
	Piscine_Wyvern,
	Snake_Wyvern,
	Temnoceran
}

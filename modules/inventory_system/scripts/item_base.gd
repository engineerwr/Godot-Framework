# Item base do inventory
# Ou seja todo e qualquer item do inventorio sera um ItemBase
extends TextureRect
class_name ItemBase

enum item_type {
	COMSUMIBLE,
	WEAPON,
	ARMOR,
	RESOURCE
}

enum item_effect {
	HEAL,
	STATUS_MODIFIER,
	CURSE,
	TEMP_AURA
}

@export var item_name: String
@export var id: String
@export var icon: Texture2D
var type: item_type
var effect: item_effect
var _amount: int

func pick_item():
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	
func put_item():
	mouse_filter = Control.MOUSE_FILTER_PASS

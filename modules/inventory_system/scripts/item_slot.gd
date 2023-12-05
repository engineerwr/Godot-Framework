extends TextureRect
class_name ItemSlot

enum SlotType {
	EQUIPAMENT,
	BASE
}


@export var debug_icon: Texture2D
@export var id: int
@export var slot_type: SlotType
@export var default_slot: Texture2D

func set_item(item: ItemBase) -> void:
	pass

func _ready():
	texture = default_slot
	if id == 1:
		texture = debug_icon

func _get_drag_data(at_position):
	var data = {
		'origin_icon' = texture,
		'origin_node' = self,
	}
	var temp_texture = TextureRect.new()
	temp_texture.expand_mode = true
	temp_texture.size = Vector2(32,32)
	temp_texture.texture = texture
	
	var temp_control = Control.new()
	temp_control.add_child(temp_texture)
	temp_control.position = -0.5 * temp_texture.size
	set_drag_preview(temp_control)
	
	return data
	
func _can_drop_data(at_position, data):
	return true
	return false
	
func _drop_data(at_position, data):
	data['origin_node'].texture = texture
	texture = data['origin_icon']
	

extends CharacterBody2D

var enemy_velocity: float = 40
var drop_object = preload("res://modules/items/vampire_surviver_items/base_item_drop.tscn")

func _ready():
	$Area2D.connect('area_entered', on_area_entered)

func _process(_delta):
	velocity = get_player_position() * enemy_velocity
	move_and_slide()
	
func get_player_position():
	var player = get_tree().get_first_node_in_group('main_player') as Node2D
	if player != null:
		return (player.global_position - global_position).normalized()
	return Vector2.ZERO
	
func on_area_entered(collider: Area2D):
	if collider.name != 'PlayerHitBox':
		var drop_item = drop_object.instantiate() as Node2D
		get_parent().add_child.call_deferred(drop_item)
		drop_item.global_position = global_position
	else:
		GameEvents.player_take_damage()
	queue_free()
	
	

extends Node
class_name EnemyManager

var current_level: int = 1
const SPAWN_RANGE: int = 300
var player: Node2D
var enemy_object = preload("res://modules/ai/vampire_survival_ai/component/base_enemy.tscn")

func _ready():
	$Timer.connect('timeout', spawn_enemy)
	player = get_tree().get_first_node_in_group('main_player') as Node2D

func spawn_enemy():
	if not player:
		return
	
	var random_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))
	var spawn_position = player.global_position + (random_direction * SPAWN_RANGE)
	var enemy = enemy_object.instantiate() as Node2D
	enemy.add_to_group('enemy')
	get_parent().add_child(enemy)
	enemy.global_position = spawn_position

func increase_dif():
	$Timer.wait_time = $Timer.wait_time * 0.9

extends Node
class_name GameManager

@onready var timer = $LevelTimer as Timer
var current_player_experience: int = 0
var time_minutes: int = 0
var player_health: int
@export var upgrade_manager: UpgradeManager
@export var enemy_manager: EnemyManager

func _ready():
	player_health = 100
	GameEvents.connect('experience_item_collected', add_exp)
	GameEvents.connect('update_player_lives', player_take_damage)
	timer.connect('timeout', add_minutes)
	timer.connect('timeout', increase_dif)

func add_minutes():
	time_minutes += 1

func get_current_time():
	var current_level_time = timer.wait_time - timer.time_left
	var min = floor(current_level_time/60)
	var sec = current_level_time - (min * 60)
	return str(time_minutes)+":"+("%02d" % floor(sec))

func add_exp(amount: int):
	current_player_experience += amount
	current_player_experience -= upgrade_manager.upgrade(current_player_experience)

func get_exp():
	return "Exp:" + str(current_player_experience)

func player_take_damage():
	player_health -= 1
	if player_health <= 0:
		pass # todo: logica de game over

func get_live():
	return "Lives:" + str(player_health)

func increase_dif():
	enemy_manager.increase_dif()

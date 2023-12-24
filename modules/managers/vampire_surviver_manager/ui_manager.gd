extends Node

@export var game_manager: GameManager
@export var upgrade_manager: UpgradeManager
var time_label: Label
var exp_label: Label
var dificult_label: Label
var health_label: Label

func _ready():
	time_label = $Canvas/TimeLabel
	exp_label = $Canvas/ExpLabel
	dificult_label = $Canvas/DificultLabel
	health_label= $Canvas/HealthLabel
	GameEvents.connect('update_exp_label', update_exp)
	GameEvents.connect('update_player_lives', update_lives)
	
func _process(_delta):
	time_label.text = game_manager.get_current_time()
	dificult_label.text = "Level: " + str(upgrade_manager.currentUpgradeLevel)

func update_exp():
	exp_label.text = game_manager.get_exp()
	
func update_lives():
	health_label.text = game_manager.get_live()

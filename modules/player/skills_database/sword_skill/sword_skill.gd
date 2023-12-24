extends BaseAbility
class_name SwordSkill

var player: Node2D
var skill_object = preload("res://modules/player/skills_database/sword_skill/sword_object.tscn")

func _init(main_player):
	player = main_player as Node2D
	skillRange = 300
	cooldown = 2

func activateSkill():
	if player == null:
		return
		
	var enemies = player.get_parent().get_tree().get_nodes_in_group('enemy')
	enemies = enemies.filter(func(enemy: Node2D):
		return enemy.global_position.distance_squared_to(player.global_position) < pow(skillRange, 2))

	if enemies.size() == 0:
		return
		
	enemies.sort_custom(func(a:Node2D, b:Node2D):
		var a_distance = a.global_position.distance_squared_to(player.global_position)
		var b_distance = b.global_position.distance_squared_to(player.global_position)
		return a_distance < b_distance)
	
	
	var sword_instance = skill_object.instantiate() as Node2D
	player.get_parent().add_child.call_deferred(sword_instance)
	sword_instance.global_position = enemies[0].global_position

func canAffordSkill() -> bool:
	return true
	
func upgradeSkill():
	pass

func get_timer():
	var timer = Timer.new()
	timer.autostart = true
	timer.wait_time = cooldown
	timer.connect('timeout', activateSkill)
	return timer
	

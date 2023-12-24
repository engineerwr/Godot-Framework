extends Node
class_name SkillManager

var active_skills = {}
var skills_database = {}
var main_player

func _ready():
	main_player = get_tree().get_first_node_in_group('main_player') as Node2D
	skills_database['sword'] = SwordSkill.new(main_player)
	_add_skill_to_active('sword')

func _add_skill_to_active(skill_name: String):
	active_skills[skill_name] = skills_database[skill_name]
	var skill = active_skills[skill_name]
	var timer = skills_database['sword'].get_timer()
	if timer:
		_add_timer_to_manager(timer)
		skill.activateSkill()

func _upgrade_skill_level(skill_name: String):
	var skill_to_upgrade = active_skills[skill_name]
	skill_to_upgrade.upgradeSkill()

func _call_manual_skill(skill_name: String):
	var skill = active_skills[skill_name]
	skill.triggerSkill()

func _add_timer_to_manager(timer):
	add_child(timer)
	

extends Node
class_name BaseAbility

@export var cooldown: float = 1.0
var isOnCooldown: bool = false
var skillRange: float = 1.0

func activateSkill():
	if isOnCooldown or not canAffordAbility():
		return

	# Execute os efeitos da habilidade aqui

	startCooldown()

func canAffordAbility() -> bool:
	return false
	
func upgradeSkill():
	pass

func startCooldown():
	isOnCooldown = true
	# Agende uma chamada para encerrar o cooldown após o tempo especificado
	await get_tree().create_timer(cooldown).timeout
	endCooldown()

func endCooldown():
	isOnCooldown = false
	

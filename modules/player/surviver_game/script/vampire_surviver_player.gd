extends CharacterBody2D

var _player_velocity: float = 100

func _ready():
	pass
	
func _process(_delta):
	var player_moviment = _get_player_moviment()
	var moviment_normalized = player_moviment.normalized()
	velocity = moviment_normalized * _player_velocity
	move_and_slide()

func _get_player_moviment():
	var h_mov = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var v_mov = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return Vector2(h_mov, v_mov)
	
func take_damage():
	GameEvents.player_take_damage()

extends Camera2D

var target_player: Node2D

func _ready():
	make_current()
	var player_node = get_tree().get_nodes_in_group("main_player")
	if player_node.size() > 0:
		target_player = player_node[0] as Node2D
		
	
func _process(delta):
	global_position = position.lerp(target_player.global_position, delta * 5) 

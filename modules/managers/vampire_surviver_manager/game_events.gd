extends Node

signal experience_item_collected(number: int)
signal update_exp_label
signal update_player_lives

func experience_collected(number: int):
	experience_item_collected.emit(number)
	update_ui()

func update_ui():
	update_exp_label.emit()

func player_take_damage():
	update_player_lives.emit()
	

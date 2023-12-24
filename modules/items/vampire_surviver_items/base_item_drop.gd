extends Node
class_name BaseItemDrop


func _ready():
	$Area2D.connect('area_entered', pick_item)

func pick_item(_other_coll: Area2D):
	queue_free()
	GameEvents.experience_collected(1)
	

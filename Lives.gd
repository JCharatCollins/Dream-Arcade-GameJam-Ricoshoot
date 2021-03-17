extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_destroyed():
	if get_child(0).get_child_count() != 0:
		get_child(0).get_child(get_child(0).get_child_count()-1).queue_free()
	else:
		get_tree().change_scene("res://GameOver.tscn")
	pass # Replace with function body.

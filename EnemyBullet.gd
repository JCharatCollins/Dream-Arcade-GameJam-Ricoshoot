extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_child(0).play("default")
	set_global_position(get_parent().get_parent().get_global_position()+Vector2(0,15))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(Vector2(0,5))
	if get_global_position().y>150:
		self.queue_free()
	pass

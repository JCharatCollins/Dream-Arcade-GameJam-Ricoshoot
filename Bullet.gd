extends KinematicBody2D

var targetVector : Vector2

signal bulletLost
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_global_position().y > 250:
		emit_signal("bulletLost")
		set_global_position(self.get_parent().get_parent().get_global_position())
	if self.get_parent().get_parent().hasBullet == false:
		move_and_collide(targetVector)
		var collisionInfo = move_and_collide(targetVector)
		if collisionInfo:
			get_child(0).play()
			targetVector = targetVector.bounce(collisionInfo.normal)
	else:
		self.move_and_slide((self.get_parent().get_parent().get_global_position()-self.get_global_position())*10)
	pass

func _on_Projectiles_fireProjectile():
	targetVector = (get_global_mouse_position() - self.get_global_position())*0.01
	get_child(0).play()

extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_child(0).set_text("0")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _scoreIncrease():
	print("A")
	get_child(0).set_text(str(int(get_child(0).get_text())+10))
	if int(get_child(0).get_text())%300==0:
		get_parent().stage += 1

func _on_BulletHitbox_area_shape_entered(area_id, area, area_shape, self_shape):
	_scoreIncrease()
	pass # Replace with function body.

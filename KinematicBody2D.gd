extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var hasBullet : bool
var currentInput
var iframes
signal shoot
signal destroyed

var animPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animPlayer = get_child(2)
	animPlayer.play("Idle")
	currentInput = Vector2(0, 0)
	hasBullet = true
	iframes = 0;
	self.set_global_position(Vector2(0,30))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (iframes > 0):
		iframes -= 1
	if (animPlayer.get_animation() != "Explosion"):
		currentInput = inputProcess(Input.is_action_pressed("Left"), Input.is_action_pressed("Right"), Input.is_action_pressed("Up"), Input.is_action_pressed("Down"))
		self.move_and_slide(Vector2(300,300)*currentInput)
		if (Input.is_action_pressed("ui_accept")):
			print(self.get_global_position())
		if Input.is_action_just_pressed("Shoot") and hasBullet == true:
			emit_signal("shoot")
			hasBullet = false
	else:
		if animPlayer.get_frame() == 4:
			animPlayer.play("Idle")
		pass

func inputProcess(left, right, up, down):
	var hDir
	var vDir
	if (left and right):
		hDir = 0
	elif left:
		hDir = -1
	elif right:
		hDir = 1
	else:
		hDir = 0
	if (up and down):
		vDir = 0
	elif up:
		vDir = -1
	elif down:
		vDir = 1
	else:
		vDir = 0
	return Vector2(hDir, vDir)

func _on_Area2D_area_shape_entered(area_id, area, area_shape, self_shape):
	for i in get_child(1).get_overlapping_areas().size():
		if get_child(1).get_overlapping_areas()[i].get_name() == "BulletHitbox":
			hasBullet = true


func _on_PlayerHitbox_area_shape_entered(area_id, area, area_shape, self_shape):
	for i in get_child(1).get_overlapping_areas().size():
		if get_child(1).get_overlapping_areas()[i].get_name() == "EnemyBulletHitbox":
			if get_child(2).get_animation() != "Explosion" and iframes <= 0:
				iframes = 300
				emit_signal("destroyed")
				self.get_child(2).play("Explosion")
				self.get_child(4).play()

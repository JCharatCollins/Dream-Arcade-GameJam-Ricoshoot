extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_global_position(Vector2(0,0))
	self.set_scale(Vector2(0.3,0.3))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var currentInput = inputProcess(Input.is_action_pressed("Left"), Input.is_action_pressed("Right"), Input.is_action_pressed("Up"), Input.is_action_pressed("Down"))
	self.translate(Vector2(5,5)*currentInput)
	if (Input.is_action_pressed("ui_accept")):
		print(self.get_global_position())

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
#func boxInPlayer(pos, vector):
#	var newVector = pos+vector
#	var boxVector : Vector2
#	if newVector.y > 40:
#		boxVector.y = 0
#	elif newVector.y < -40:
#		boxVector.y = 0
#	else:
#		boxVector.y = newVector.y
#	if newVector.x < -260:
#		boxVector.x = 0
#	if newVector.x > 260:
#		boxVector.x = 0
#	else:
#		boxVector.x = newVector.x
#	return boxVector

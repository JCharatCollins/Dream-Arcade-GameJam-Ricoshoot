extends KinematicBody2D
const enemyBullet = preload("res://EnemyBullet.tscn")
var direction = Vector2(1, 0)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal destroyed

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("destroyed", get_node("../Score"), "_scoreIncrease")
	self.set_global_position(direction*Vector2(350, -500))
	randomize()
	var enemyHurtboxType = rand_range(0, 3)
	if enemyHurtboxType<1:
		get_child(0).play("LeftHurtbox")
		get_child(1).get_child(0).adjustHurtbox(Vector2(-30, 0), Vector2(9, 32))
	elif enemyHurtboxType>1 and enemyHurtboxType<2:
		get_child(0).play("RightHurtbox")
		get_child(1).get_child(0).adjustHurtbox(Vector2(30, 0), Vector2(9, 32))
	else:
		get_child(0).play("TopHurtbox")
		get_child(1).get_child(0).adjustHurtbox(Vector2(0, -32), Vector2(32, 9))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	randomize()
	if randi()%100+1 == 1:
		var bullet = enemyBullet.instance()
		self.get_child(3).add_child(bullet)
		self.get_child(5).play()
	enemyBehavior(delta)
	pass

func enemyBehavior(delta):
	if get_child(0).frame==4:
		self.queue_free()
	elif (abs(get_global_position().x)>268):
		$EnemyCollisionBox.disabled = true
		self.move_and_slide(-1*direction*Vector2(50,0))
	else:
		$EnemyCollisionBox.disabled = false
		var collisionInfo = move_and_collide(-1*direction*Vector2(50,0)*delta)
		if collisionInfo:
			self.move_and_slide(Vector2(0,1000))
			direction.x = direction.x*-1
		pass
func set_direction(dir):
	direction = dir
func calculateEnemyMovement(vector, pos):
	var newVector : Vector2
	newVector = vector
	if pos.x+vector.x>300:
		newVector.x = 300-pos.x
	elif pos.x+vector.x<-300:
		newVector.x=-300-pos.x
	return newVector

func _on_EnemyHurtbox_area_shape_entered(area_id, area, area_shape, self_shape):
	for i in get_child(1).get_overlapping_areas().size():
		print(get_child(1).get_overlapping_areas()[i].get_name())
		if get_child(1).get_overlapping_areas()[i].get_name() == "BulletHitbox":
			self.get_child(0).play("Explosion")
			get_child(4).play()
			$EnemyCollisionBox.disabled = true
			emit_signal("destroyed")
	pass # Replace with function body. 

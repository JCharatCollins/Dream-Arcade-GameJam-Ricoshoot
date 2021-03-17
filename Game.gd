extends Node2D
signal spawnEnemy

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var gameTime
var stage = 0
var enemiesNode
var enemies
# Called when the node enters the scene tree for the first time.
func _ready():
	enemiesNode = get_child(0)
	get_child(10).play(0)
	gameTime = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	gameTime += delta
	randomize()
	if (enemiesNode.get_child_count() == 0):
		stage += 1
		emit_signal("spawnEnemy")
		gameTime = 0
		enemies = stage
	if gameTime >= 1 and enemies > 0:
		gameTime = 0
		emit_signal("spawnEnemy")
		enemies -= 1


func _on_AudioStreamPlayer_finished():
	get_child(10).play(0)
	pass # Replace with function body.

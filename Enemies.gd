extends Node
const enemy = preload("res://Enemy.tscn")
var enemySpawnLoc = Vector2(1, 1)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_Game_spawnEnemy():
	var newEnemy = enemy.instance()
	newEnemy.set_direction(enemySpawnLoc)
	enemySpawnLoc.x = enemySpawnLoc.x * -1
	add_child(newEnemy)
	pass # Replace with function body.

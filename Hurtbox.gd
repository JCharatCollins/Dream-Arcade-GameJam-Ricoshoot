extends CollisionShape2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func adjustHurtbox(offset : Vector2, extent : Vector2):
	self.set_position(offset)
	var newHurtbox = RectangleShape2D.new()
	newHurtbox.set_extents(extent)
	self.set_shape(newHurtbox)


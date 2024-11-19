extends Node2D

var level = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	#pass
	$Level2.set_layer_enabled(1, false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

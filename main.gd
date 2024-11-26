extends Node2D
var levels = 3
var curr_level = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	$Levels.show_level(curr_level, levels)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_door_advance():
	curr_level += 1
	$Levels.show_level(curr_level, levels)

extends Node2D
var levels = 3
var curr_level = 1

var player_location = [Vector2(188, 533), Vector2(74, 119)]
var door_position = [Vector2(1111, 395), Vector2(978, 327)]

var dead = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.position = player_location[curr_level-1]
	$ColorRect.self_modulate.a = 0
	$Door.position = door_position[curr_level-1]
	$Levels.show_level(curr_level, levels)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Player.position.y >= 764 and dead == false:
		dead = true
		$AnimationPlayer.play("fade_in")
		await get_tree().create_timer(1.5).timeout
		respawnPlayer()
		$AnimationPlayer.play("fade_out")
		await get_tree().create_timer(1.5).timeout
		dead = false
		
func respawnPlayer():
	$Player.position = player_location[curr_level-1]


func _on_door_advance():
	curr_level += 1
	$Player.position = player_location[curr_level-1]
	$Door/AnimationPlayer.play("Door_close")
	$Door.position = door_position[curr_level-1]
	$Levels.show_level(curr_level, levels)

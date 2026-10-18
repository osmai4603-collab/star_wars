extends Node2D

#1. load the scene
var meteor_scene:PackedScene = load("res://scenes/meteor.tscn")
var laser_scene:PackedScene = load("res://scenes/laser.tscn")


func _ready() -> void:
	#stars
	var size = get_viewport().get_visible_rect().size
	var rng := RandomNumberGenerator.new()
	for star in $Stars.get_children():
		#position
		var rand_x := rng.randi_range(0, size.x)
		var rand_y := rng.randi_range(0, size.y)
		star.position = Vector2(rand_x, rand_y)
		var rand_scale := rng.randf_range(1, 2)
		star.scale = Vector2(rand_scale, rand_scale)
		star.speed_scale = rng.randf_range(0.6, 1.4)

func _on_meteor_timer_timeout() -> void:
	#2. create an instance.
	var meteor = meteor_scene.instantiate()
	
	#3. add child to scene tree.
	$Meteors.add_child(meteor)
	 


func _on_player_laser(position: Vector2) -> void:
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = position

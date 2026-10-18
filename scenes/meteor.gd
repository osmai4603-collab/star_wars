extends Area2D

var speed:int
var rotation_speed:int
var direction_x:float

func _ready() -> void:
	var rng := RandomNumberGenerator.new()
	
	# texture
	var path := "res://graphics/Meteors/" + str(rng.randi_range(1, 4)) + ".png"
	$Sprite2D.texture = load(path)
	
	# start position
	var width := get_viewport().get_visible_rect().size[0]
	var rand_x := rng.randi_range(0, width)
	var rand_y := rng.randi_range(-150, -50)
	
	position = Vector2(rand_x, rand_y)
	speed = rng.randi_range(200, 500)
	direction_x = rng.randf_range(-1, 1)
	rotation_speed = rng.randi_range(40, 100)

func _process(delta: float) -> void:
	position += Vector2(direction_x, 1.0) * speed * delta
	rotation_degrees += rotation_speed * delta

func _on_body_entered(body: Node2D) -> void:
	print('body entered')
	print(body)

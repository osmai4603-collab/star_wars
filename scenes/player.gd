extends CharacterBody2D

@export var speed:int = 500
var can_shoot:bool = true

signal laser(pos)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(200, 500)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(delta)
	var direction = Input.get_vector("left", "right", "up", "down")
	#position += direction * speed * delta
	velocity = direction * speed
	move_and_slide()
	
	# shoot input
	if Input.is_action_just_pressed("shoot") and can_shoot:
		laser.emit($MarkerStartPosition.global_position)
		can_shoot = false
		$LaserTimer.start()
		
		


func _on_laser_timer_timeout() -> void:
	can_shoot = true

extends CharacterBody2D

signal laser(pos)
var speed = 400
var can_shoot: bool = true
var rotation_speed = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position += Vector2(100,100)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	#get_node("player_image").rotation += 0.1 * delta
	#$player_image.rotation += 0.1 * delta
	move_and_slide()
	if Input.is_action_just_pressed("shoot") and can_shoot:
		laser.emit($laser_start_position.global_position)
		can_shoot = false
		$laser_timer.start()

func _on_laser_timer_timeout() -> void:
	can_shoot = true

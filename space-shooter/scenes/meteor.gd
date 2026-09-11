extends Area2D

var speed : int
var rotation_speed: int
var direction_x : float

func _ready():
	var rng := RandomNumberGenerator.new()
	print(get_viewport().get_visible_rect())
	var width = get_viewport().get_visible_rect().size[0]
	var length = get_viewport().get_visible_rect().size[1]
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(0, -length)
	position = Vector2(random_x, -length)

	var path: String = "res://assets/PNG/Meteors/meteor" + str(rng.randi_range(1,6)) + ".png"
	$MeteorBrownBig4.texture = load(path)
	
	speed = rng.randi_range(200, 500)
	direction_x = rng.randf_range(-1,1)
	rotation_speed = rng.randi_range(25, 100)
	
func _process(delta):
	position += Vector2(direction_x, 1.0) * speed * delta
	#rotation_speed += rotation_speed * delta
	rotation_degrees += rotation_speed * delta
func _on_body_entered(body: Node2D) -> void:
	print("collision")

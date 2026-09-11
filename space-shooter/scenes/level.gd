extends Node2D

var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://scenes/laser.tscn")

func _on_meteor_timer_timeout() -> void:
	var meteor = meteor_scene.instantiate()
	add_child(meteor)
	


func _on_player_laser(position) -> void:
	var laser = laser_scene.instantiate()
	$laser.add_child(laser)
	laser.position = position

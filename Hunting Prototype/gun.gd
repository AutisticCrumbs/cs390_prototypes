extends StaticBody3D

@onready var fire_location := $'Fire Here'

var bullet := preload("res://bullet.tscn")
var shot_power = 300

func _physics_process(_delta):
	fire_shot()

func fire_shot():
	if Input.is_action_just_released("shoot"):
		var current_shot = bullet.instantiate()
		var origin = fire_location.global_position
		fire_location.add_child(current_shot)
		current_shot.global_position = origin
		current_shot.apply_central_impulse(fire_location.global_transform.basis.z * shot_power * -1)

extends StaticBody3D

var shot := preload("res://shot.tscn")

@onready var reload_timer := $"Reload Timer"

var shot_power = 25
var reloaded = true
signal shot_fired

@onready var spawn = $Marker3D

func _physics_process(_delta):
	fire_shot()

func fire_shot():
	if Input.is_action_just_released("shoot"):
		if reloaded == true:
			shot_fired.emit()
			var current_shot = shot.instantiate()
			var origin = spawn.global_position
			$Marker3D.add_child(current_shot)
			current_shot.global_position = origin
			current_shot.apply_central_impulse(spawn.global_transform.basis.z * shot_power * -1)
			reloaded = false
			reload_timer.start()

func _on_reload_timer_timeout():
	reloaded = true

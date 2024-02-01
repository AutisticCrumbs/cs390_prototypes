extends CharacterBody3D

var cannonball := preload("res://cannon/shot.tscn")
var gravity = 10
var shot_power = 25
var hit_num = 0

@onready var total_hits := $"Hit Count"
@onready var spawn = $Camera3D/Spawn
@onready var fire_sound := $AudioStreamPlayer3D

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x) * 0.25)
		$Camera3D.rotate_x(deg_to_rad(-event.relative.y) * 0.25)
		$Camera3D.rotation.x = clamp($Camera3D.rotation.x,deg_to_rad(-60), deg_to_rad(60))
		
func _physics_process(_delta):
	fire_shot()

func fire_shot():
	if Input.is_action_just_released("fire"):
		var current_shot = cannonball.instantiate()
		var origin = spawn.global_position
		$Camera3D.add_child(current_shot)
		current_shot.global_position = origin
		current_shot.apply_central_impulse(spawn.global_transform.basis.z * shot_power * -1)
		fire_sound.play()

func _on_target_hit():
	hit_num += 1
	_update_hit_count()

func _update_hit_count():
	total_hits.text = "Hit: %d" % hit_num

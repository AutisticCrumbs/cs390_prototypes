extends Node2D

@export var words : Array[int] = [
	0,
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	9
]

func _on_pressable_body_entered(_body):
	$Words.text = "%d" % words.pick_random()

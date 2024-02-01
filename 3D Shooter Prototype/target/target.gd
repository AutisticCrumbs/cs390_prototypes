extends Area3D

signal hit

func _on_body_entered(body):
	if body.is_in_group("shot"):
		hit.emit()

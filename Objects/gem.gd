extends Area2D

const XP_VALUE = 5

func _on_body_entered(body):
	queue_free()
	
	if body.has_method("gain_xp"):
		body.gain_xp(XP_VALUE)

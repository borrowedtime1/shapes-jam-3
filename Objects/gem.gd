extends Area2D

const XP_VALUE = 10

func _on_body_entered(body):
	%GemRectangle.visible = false
	%PickupSound.play()
	
	if body.has_method("gain_xp"):
		body.gain_xp(XP_VALUE)

func _on_pickup_sound_finished():
	queue_free()

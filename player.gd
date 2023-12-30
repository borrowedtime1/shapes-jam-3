extends CharacterBody2D

#Actions to occur every tick
func _physics_process(delta):
	
	#Movement (600 Pixels * Tick)
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	
	#if velocity.length() > 0.0:
		#rotation = direction.angle()
	

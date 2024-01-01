extends CharacterBody2D

signal health_depleted

var health = 100.0
var infinite_health = false

func _physics_process(delta):
	
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	if velocity.length() > 0:
		rotation = direction.angle()
	move_and_slide()
	
	#Get Overlapping Bodies with HurtBox
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	

	#If Overlapping Bodies > 0, hurt player
	
	const DAMAGE_RATE = 20.0
	
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
	

extends Area2D

const SPEED = 1000
const RANGE = 1200
var time_passed = 0
var travelled_distance = 0

#Actions to occur every tick
func _physics_process(delta):
	
	var direction

	# If time passed is less than 25 ticks, pull weapon
	if time_passed < 25:
		direction = Vector2.LEFT.rotated(rotation)
		position += direction * 35 * delta
		time_passed += 1
	
	# If time passed equals 25, throw weapon
	if time_passed == 25:
		direction = Vector2.RIGHT.rotated(rotation)
		position += direction * SPEED * delta
		travelled_distance += SPEED * delta
		
		#Delete weapon once range is exceeded
		if travelled_distance > RANGE:
			queue_free()
		
		
	
	
	

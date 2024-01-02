extends Area2D

@onready var player = get_node("/root/Game/Player")
@onready var hp = (player.level / 3) + 1


var travelled_distance = 0


const SPEED = 1000
const RANGE = 2000

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	
	#Speed and Distance
	position += direction * SPEED * delta
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body):
	
	if body.has_method("take_damage"):
		body.take_damage()
	
	hp -= 1
	
	if hp == 0:
		queue_free()
		
		

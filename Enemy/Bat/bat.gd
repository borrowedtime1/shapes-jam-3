extends CharacterBody2D

signal enemy_death

@onready var player = get_node("/root/Game/Player")

#Bat Health
var health = 3


func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	move_and_slide()
	
# Take Damage (-1 Health)
func take_damage():
	health -=1
	
	#If health depleted, destroy bat
	if health == 0:
		queue_free()
		
		
	
	

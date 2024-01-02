extends CharacterBody2D

signal boss_death

@onready var player = get_node("/root/Game/Player")
@onready var hud = get_node("/root/Game/GameHUD")

#Bat Health
var health = 300

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 500.0
	move_and_slide()
	
# Take Damage (-1 Health)
func take_damage():
	health -=1
	
	#If health depleted, destroy bat
	if health == 0:
		queue_free()
		hud.win()
		

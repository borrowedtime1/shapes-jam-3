extends CharacterBody2D

@onready var player = get_node("/root/Game/Player")
#Slime Health
var health = 3
var new_gem
var baby_slime

func _ready():
	%SlimeSprite.play()


func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	move_and_slide()
	
# Take Damage (-1 Health)
func take_damage():
	health -=1
	
	#If health depleted, destroy slime, create gem and spawn two baby slimes nearby
	if health == 0:
		%SlimeSprite.visible = false
		%DeathSound.play()
		spawn_gem()
		
		spawn_baby_slimes()
		
		

func _on_death_sound_finished():
	queue_free()
	"res://Enemy/SlimeBaby/slimebaby.tscn"

func spawn_gem():
	new_gem = preload("res://Objects/gem.tscn").instantiate()
	get_parent().add_child(new_gem)
	new_gem.global_position = global_position

#Spawn_Baby_Slimes - Spawns baby slimes at a slight offset to parent position when spawning
func spawn_baby_slimes():
	
	var rand = randi_range(1,4)
	
	for i in range(rand):
		baby_slime = preload("res://Enemy/SlimeBaby/slimebaby.tscn").instantiate()
		get_parent().add_child(baby_slime)
		var random_offset = Vector2(randi_range(1, 5), randi_range(1, 5))
		baby_slime.global_position = global_position + random_offset
		baby_slime.global_position.direction_to(player.global_position)
	
	

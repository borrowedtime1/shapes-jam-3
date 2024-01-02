extends Area2D

var speed_upgrade = 0
var level = 1

@onready var player = get_node("/root/Game/Player")

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies() # Get Overlapping bodies in area
	
	#Look at and shoot nearest enemy
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)
		
	update_gun()


#Shoot Bullet

func shoot():
	const BULLET = preload("res://Weapons/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)
	%ShootSound.play()

func _on_timer_timeout():
	shoot()
	
func update_gun():
	level = player.gun_level
	
	match level:
		1:
			%ShootTimer.wait_time = 0.5
		2:
			%ShootTimer.wait_time = 0.3
		3:
			%ShootTimer.wait_time = 0.2


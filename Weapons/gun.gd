extends Area2D

var speed_upgrade = 0

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies() # Get Overlapping bodies in area
	
	#Look at and shoot nearest enemy
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)


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


extends Node2D

func spawn_mob():
	var rand = randi_range(1 ,2)
	
	var new_mob
	
	if rand == 1:
		new_mob = preload("res://Enemy/Slime/slime.tscn").instantiate()
		
	if rand == 2:
		new_mob = preload("res://Enemy/Bat/bat.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	


func _on_timer_timeout():
	spawn_mob()
	spawn_mob()
	spawn_mob()
	spawn_mob()
	


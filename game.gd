extends Node2D

var spawn_timer_delay = 5.0

func _ready():
	%SpawnTimer.set_wait_time(spawn_timer_delay)

func spawn_mob():
	var rand = randi_range(1, 10)
	
	var new_mob
	
	# If rand is less than 3, spawn slime
	if rand < 10:
		new_mob = preload("res://Enemy/Slime/slime.tscn").instantiate()
	
	# If rand is 4, spawn bat
	if rand == 10:
		new_mob = preload("res://Enemy/Bat/bat.tscn").instantiate()
	
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	

func _on_spawn_timer_timeout():
	spawn_mob()


func _on_difficulty_timer_timeout():
	if spawn_timer_delay >= 0.5:
		spawn_timer_delay -= 0.5
		%SpawnTimer.set_wait_time(spawn_timer_delay)



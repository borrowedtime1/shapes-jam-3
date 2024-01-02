extends Node2D

var spawn_timer_delay = 4
var spawn_count = 1
var difficulty_increases = 1
const BOSS_LV = 10
var hud
var boss_spawned = false

func _ready():
	%SpawnTimer.set_wait_time(spawn_timer_delay)
	hud = get_node("/root/Game/GameHUD")

func spawn_mob(count):
	if difficulty_increases == BOSS_LV and boss_spawned == false:
		var boss = preload("res://Enemy/Ghost/ghost.tscn").instantiate()
		add_child(boss)
		boss_spawned = true
	if difficulty_increases < BOSS_LV:
		for i in count:
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
	spawn_mob(spawn_count)


func _on_difficulty_timer_timeout():
	difficulty_increases += 1
	if difficulty_increases % 2 == 0:
		spawn_count += 1
	if spawn_timer_delay >= 0.5:
		spawn_timer_delay -= 0.5
		%SpawnTimer.set_wait_time(spawn_timer_delay)
		hud.update_diff(difficulty_increases)


func _on_hud_update_timer_timeout():
	hud.update_timer(%DifficultyTimer.time_left)

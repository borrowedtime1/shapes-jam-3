extends Control

var level = "res://game.tscn"




func _on_button_exit_pressed():
	get_tree().quit()


func _on_button_play_pressed():
	var _level = get_tree().change_scene_to_file(level)

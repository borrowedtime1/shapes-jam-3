extends CanvasLayer

@onready var levelPanel = get_node("%LevelUp")
@onready var upgradeOptions = get_node("%UpgradeOptions")
@onready var sndLevelUp = get_node("%sound_levelup")
@onready var itemOptions = preload("res://UI/item_option.tscn")

func update_health(hp):
	%HPBar.set_value(hp)

func update_xp(xp):
	%XPBar.set_value(xp)
 
func update_level(level):
	%LevelNumber.set_text(str(level))

func start_state():
	%GrayScreen.visible = true
	%StartText.visible = true
	%PauseText.visible = false
	%GameOverText.visible = false
	
func play_state():
	%GrayScreen.visible = false
	%StartText.visible = false
	%PauseText.visible = false
	%GameOverText.visible = false

func pause_state():
	%GrayScreen.visible = true
	%StartText.visible = false
	%PauseText.visible = true
	%GameOverText.visible = false

func gameover_state():
	%GrayScreen.visible = true
	%StartText.visible = false
	%PauseText.visible = false
	%GameOverText.visible = true
	%GameOverSound.play()
	
func levelup():
	sndLevelUp.play()
	#var tween = levelPanel.create_tween()
	#tween.tween_property(levelPanel,"position", Vector2(735,363), 0.2).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN)
	#tween.play()
	#levelPanel.visible = true
	#var options = 0
	#var optionsmax = 3
	#
	##While options available are less than the maximum
	#while options < optionsmax:
		#var option_choice = itemOptions.instantiate()
		#upgradeOptions.add_child(option_choice)
		#options += 1
#
	#get_tree().paused = true
	#
#func upgrade_character(upgrade):
	#var option_children = upgradeOptions.get_children()
	#
	#for i in option_children:
		#i.queue_free()
	#levelPanel.visible = false
	#levelPanel.position = Vector2(800,50)
	#get_tree().paused = false




func _on_button_exit_pressed():
	get_tree().quit()
	
	


func _on_button_retry_pressed():
	var level = "res://game.tscn"
	get_tree().paused = false
	var _level = get_tree().change_scene_to_file(level)

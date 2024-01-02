extends CanvasLayer

@onready var levelPanel = get_node("%LevelUp")
@onready var upgradeOptions = get_node("%UpgradeOptions")
@onready var sndLevelUp = get_node("%sound_levelup")

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
	var tween = levelPanel.create_tween()
	tween.tween_property(levelPanel,"position", Vector2(735,363), 0.2).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN)
	tween.play()
	levelPanel.visible = true
	get_tree().paused = true
	

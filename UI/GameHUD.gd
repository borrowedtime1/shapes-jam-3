extends CanvasLayer

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
	

extends CanvasLayer

func update_xp(xp):
	%XPBar.set_value(xp)
 
func update_level(level):
	%LevelNumber.set_text(str(level))

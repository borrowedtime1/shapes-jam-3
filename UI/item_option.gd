extends ColorRect

var mouse_over = false
var item = null

@onready var hud = preload("res://UI/GameHUD.tscn")

@onready var label_description = $label_description
@onready var label_name = $label_name
@onready var label_level = $label_level

signal selected_upgrade(upgrade)

func _ready():
	connect("selected_upgrade",Callable(hud,"upgrade_character"))
	if item == null:
		item ="food"
		
	label_name.text = "Test"
	label_description.text = "Test"
	label_level = "Test"

#input
func _input(event):

	#If mouse is clicked, check if mouse is over an upgrade and then select it
	if event.is_action("click"):
		if mouse_over:
			emit_signal("selected_upgrade", item)

#on_mouse_entered
func _on_mouse_entered():
	mouse_over = true

#on_mouse_exited
func _on_mouse_exited():
	mouse_over = false

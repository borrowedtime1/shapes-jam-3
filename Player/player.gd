extends CharacterBody2D

signal health_depleted

var health = 100.0
var infinite_health = false
var xp = 0
var level = 1
var hud

var gun_level = 1

@onready var levelPanel = get_node("%LevelUp")
@onready var upgradeOptions = get_node("%UpgradeOptions")
@onready var sndLevelUp = get_node("%sound_levelup")
func _ready():
	hud = get_node("/root/Game/GameHUD")

func _physics_process(delta):
	
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	if velocity.length() > 0:
		rotation = direction.angle()
	move_and_slide()
	
	#Get Overlapping Bodies with HurtBox
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	

	#If Overlapping Bodies > 0, hurt player
	
	const DAMAGE_RATE = 20.0
	
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		# %ProgressBar.value = health
		hud.update_health(health)
		if health <= 0:
			get_tree().paused = true
			hud.gameover_state()


func gain_xp(points):
	xp += points
	hud.update_xp(xp)
	
	#If XP is 100 or more level up
	if xp >= 100:
		xp -= 100
		level += 1
		hud.update_level(level)
		hud.levelup()
		gun_level = level
	
	

	


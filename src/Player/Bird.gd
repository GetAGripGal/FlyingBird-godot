extends KinematicBody2D

var motion = Vector2()
var gravity = 20

var score = 0

onready var canMove = true

onready var Timer = get_node("Timer")
onready var Sprite = get_node("Sprite")

onready var Menu = get_node("CanvasLayer").get_node("Control")
onready var ScoreMenu = get_node("CanvasLayer").get_node("Score").get_node("RichTextLabel")
onready var ScoreMenuLabel = get_node("CanvasLayer").get_node("Control").get_node("RichTextLabel")

var dead = false

func _ready():
	Menu.hide()

func _physics_process(_delta):
	motion.y += gravity
	#MoveMent(_delta)
	logic()
	motion = move_and_slide(motion)
	

func _process(_delta):
	ScoreMenu.text = str(score)
	ScoreMenuLabel.text = "Score: " + str(score)

func _input(event):
	if event is InputEventScreenTouch and event.pressed:
		if canMove:
			motion.y = 0
			motion.y -= 425
			canMove = false
			Timer.start()
	elif event is InputEventMouseButton and event.pressed:
		if canMove:
			motion.y = 0
			motion.y -= 425
			canMove = false
			Timer.start()
#
#func MoveMent(_delta):
#	motion.y += gravity
#	
#	if canMove:
#		if Input.is_action_just_pressed("Tap"):
#			motion.y = 0
#			motion.y -= 425
#			canMove = false
#			Timer.start()
#
	motion = move_and_slide(motion)

func logic():
	pass

func _on_Timer_timeout():
	canMove = true

func die():
	dead = true
	canMove = false
	Menu.show()


func _on_collison_area_entered(area):
	if area.name == "AreaDetect":
		die()


func _on_Button_pressed():
	pass # Replace with function body.

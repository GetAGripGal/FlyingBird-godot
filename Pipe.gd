extends KinematicBody2D

var motion = Vector2()

onready var Timer = get_node("Timer")
onready var Player = get_parent().get_parent().get_node("Bird")
onready var Pipe = load("res://src/Pipe/Pipe.tscn").instance()

func _ready():
	set_position(Vector2(600, rand_range(150,600)))


func _physics_process(_delta):
	if(Player.dead == false):
		motion.x = -150
	else:
		motion.x = 0
		Timer.stop()

	motion = move_and_slide(motion)

#func _on_AreaDetect_area_entered(body):
#	if body.name == "Border":
#		queue_free()


func _on_Timer_timeout():
	get_parent().add_child(Pipe)


func _on_ScoreDetect_area_entered(area):
	if area.is_in_group("player"):
		Player.score += 1 

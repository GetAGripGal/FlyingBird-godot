extends Node2D


onready var Pipe = load("res://src/Pipe/Pipe.tscn").instance()
onready var Timer = get_node("Timer")

func _ready():
	Timer.start()


func _on_Timer_timeout():
	get_node("Layout").add_child(Pipe)

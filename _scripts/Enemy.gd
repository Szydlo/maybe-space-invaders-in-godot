extends KinematicBody2D

onready var timer = Timer.new()
var time = 3
var timerset = 0

func _ready():
	timer.connect("timeout",self,"_on_timer_timeout") 
	add_child(timer)
	timer.set_wait_time(time)
	timer.start()

func _on_timer_timeout():
	position = Vector2(position[0], position[1]+10)
	timerset += 1
	if timerset > 5:
		print("GAME OVER")
	
	timer.stop()
	timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout")
	add_child(timer) 
	timer.set_wait_time(time)
	timer.start()

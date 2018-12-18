extends KinematicBody2D

onready var bullet = preload("res://_scenes/Bullet.tscn")
onready var bullet_container = get_parent().get_node("bullet_container")
onready var enemy = preload("res://_scenes/Enemy.tscn")
onready var enemy_container = get_parent().get_node("enemy_container")
onready var shoot_player = get_parent().get_node("shot_player")
var player_position
var speed = 500
var velocity = Vector2()

func _ready():	
	var offset = 0
	var offset_y = 100
	var columns = 1
	for i in range(80):
		if (i >= (16 * columns)):
			columns += 1
			offset_y += 50
			offset = 0

		offset += 60
		var e = enemy.instance()
		enemy_container.add_child(e)
		e.position = Vector2(offset-5, offset_y)

func get_input():
    velocity = Vector2()
    if Input.is_action_pressed('ui_right'):
        velocity.x += 1
    if Input.is_action_pressed('ui_left'):
        velocity.x -= 1
		
    velocity = velocity.normalized() * speed

func _physics_process(delta):
    get_input()
    move_and_slide(velocity)

func _shoot():
	var b = bullet.instance()
	bullet_container.add_child(b)
	shoot_player.play()
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		player_position = position
		_shoot()
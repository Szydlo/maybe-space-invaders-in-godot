extends Area2D

onready var positions = get_node("/root/Background/Player").position

func _process(delta):
	positions[1] -= 5
	position = Vector2(positions[0], positions[1]-50)
	
func _on_Bullet_body_entered(body):
	body.queue_free()
	queue_free()
	var score_label = get_node("/root/Background/Score")
	score_label.text = str(int(score_label.text) + 10)
	get_node("/root/Background/hit_player").play()
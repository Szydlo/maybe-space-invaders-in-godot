extends Label

var Actual_option = 0
var tab = [272, 325]

func _ready():
	pass
	
func _input(event):
	if event.is_action_pressed("ui_down"):
		Actual_option += 1
		
		if Actual_option > tab.size()-1:
			Actual_option = tab.size()-1
			
		rect_position = Vector2(354, tab[Actual_option])	
	if event.is_action_pressed("ui_up"):
		Actual_option -= 1
		if Actual_option < 0:
			Actual_option = 0
			
		rect_position = Vector2(354, tab[Actual_option])
	
	if event.is_action_pressed("ui_accept"):
		if Actual_option == 0:
			get_tree().change_scene("res://_scenes/Game.tscn")
		if Actual_option == 1:
			get_tree().quit()
	pass
extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_new_game_pressed():
	var file = FileAccess.open("res://Saves/save.txt", FileAccess.WRITE)
	file.store_string("NewGame")
	get_tree().change_scene_to_file("res://scenes.tscn")
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_load_game_pressed():
	get_tree().change_scene_to_file("res://scenes.tscn")
	pass # Replace with function body.

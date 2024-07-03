extends CanvasLayer

func _on_new_game_pressed():
	var file = FileAccess.open("res://Saves/defSave.txt", FileAccess.READ)
	var read_file_text = file.get_as_text()
	file.close()
	
	file = FileAccess.open("res://Saves/save.txt", FileAccess.WRITE)
	file.store_string(read_file_text)
	file.close()
	
	get_tree().change_scene_to_file("res://scenes.tscn")
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_load_game_pressed():
	get_tree().change_scene_to_file("res://scenes.tscn")
	pass # Replace with function body.

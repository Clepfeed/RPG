extends Area2D




func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	#Сохранение хп, маны, позиции
	get_tree().change_scene_to_file("res://Fight_scene.tscn")
	pass # Replace with function body.

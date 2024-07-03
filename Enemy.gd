extends Area2D

@export var id = 0


#func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	#if defeated: #отключение этого врага после победы над ним
		#pass
	##Сохранение хп, маны, позиции
	#var file = FileAccess.open("Saves/save.txt", FileAccess.WRITE)
	#
	#get_tree().change_scene_to_file("res://Fight_scene.tscn")
	#pass # Replace with function body.

extends Node2D

var EnemysDefeated = []


func _ready():
	var groupe_enemys = get_tree().get_nodes_in_group("Enemy_groupe")
	#print(groupe_enemys.size())
	
	for x in groupe_enemys.size():
		EnemysDefeated.push_back(false)
		
	#for x in EnemysDefeated:
		#print(x)
		
	pass # Replace with function body.



func _on_enemy_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if EnemysDefeated[local_shape_index]:
		pass
	print(EnemysDefeated[local_shape_index])
	print(local_shape_index)
	EnemysDefeated[local_shape_index] = true
	
	get_tree().change_scene_to_file("res://Fight_scene.tscn")
	pass # Replace with function body.


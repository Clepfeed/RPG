extends Node2D

var EnemysDefeated = []

func to_fight_scene():
	var new_data = str($Player.hp) + ";" + "100" + ";" + str($Player.position.x) + ";" + str($Player.position.y) + ";"
	for i in EnemysDefeated:	
		if(i):
			new_data += "1"
		else:
			new_data += "0"
	print(new_data)
	var file = FileAccess.open("res://Saves/save.txt", FileAccess.WRITE)
	file.store_string(new_data)
	file.close()
	get_tree().change_scene_to_file("res://Fight_scene.tscn")
	pass
	

func _ready():
	var groupe_enemys = get_tree().get_nodes_in_group("Enemy_groupe")
	#print(groupe_enemys.size())
	
	for x in groupe_enemys.size():
		EnemysDefeated.push_back(false)
	
	var file = FileAccess.open("Saves/save.txt", FileAccess.READ)
	var read_file_text = file.get_as_text()
	file.close()
	
	var data = []
	for i in 5:
		var indCh = read_file_text.find(';')
		data.push_back(read_file_text.substr(0, indCh))
		read_file_text = read_file_text.substr(indCh + 1)
	
	var ind = 0
	for x in data[4]:
		if(x == '1'):
			EnemysDefeated[ind] = true
		ind += 1
	
	pass # Replace with function body.

func _on_enemy0_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if(!EnemysDefeated[0]):
		EnemysDefeated[0] = true
		to_fight_scene()
	
	pass # Replace with function body.


func _on_enemy_1_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if(!EnemysDefeated[1]):
		EnemysDefeated[1] = true
		to_fight_scene()
	pass # Replace with function body.


func _on_enemy_2_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if(!EnemysDefeated[2]):
		EnemysDefeated[2] = true
		to_fight_scene()
	pass # Replace with function body.


func _on_enemy_3_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if(!EnemysDefeated[3]):
		EnemysDefeated[3] = true
		to_fight_scene()
	pass # Replace with function body.


func _on_enemy_4_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if(!EnemysDefeated[4]):
		EnemysDefeated[4] = true
		to_fight_scene()
	pass # Replace with function body.




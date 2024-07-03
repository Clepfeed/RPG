extends Node

@export var player_hp = 0
@export var player_max_hp = 100
@export var enemy_max_hp = 50
@export var enemy_hp = enemy_max_hp
@export var player_move = true
@export var enemy_spells = 2

func enemy_move():
	var rand_move = randi_range(0, 1)
	print(rand_move)
	if (rand_move == 1):
		player_hp -= 15
		$PlayerHpBar/Bar.value = player_hp
	else:
		enemy_hp += 20
		$EnemyHpBar/Bar.value = enemy_hp
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	var file = FileAccess.open("Saves/save.txt", FileAccess.READ)
	var read_file_text = file.get_as_text()
	file.close()
	
	var data = []
	for i in 5:
		var indCh = read_file_text.find(';')
		data.push_back(read_file_text.substr(0, indCh))
		read_file_text = read_file_text.substr(indCh + 1)
	
	player_hp = float(data[0])
	$PlayerHpBar/Bar.value = player_hp
	$PlayerHpBar/Bar.max_value = player_max_hp
	$EnemyHpBar/Bar.max_value = enemy_max_hp
	$EnemyHpBar/Bar.value = $EnemyHpBar/Bar.max_value
	
	pass # Replace with function body.

func _input(event):
	#print(enemy_hp)
	#print(player_hp)
	if(event.is_action_pressed("num_1")):
		enemy_hp -= 20
		$EnemyHpBar/Bar.value = enemy_hp
		enemy_move()
	if(event.is_action_pressed("num_2")):
		enemy_hp -= 40
		$EnemyHpBar/Bar.value = enemy_hp
		enemy_move()
	if(event.is_action_pressed("num_3")):
		player_hp += 25
		$PlayerHpBar/Bar.value = player_hp
		enemy_move()	
	if(enemy_hp <= 0):
		var file = FileAccess.open("res://Saves/save.txt", FileAccess.READ)
		var read_file_text = file.get_as_text()
		file.close()
	
		read_file_text = read_file_text.substr(read_file_text.find(';') + 1)
		read_file_text = str(player_hp) + ';' + read_file_text 
		file = FileAccess.open("res://Saves/save.txt", FileAccess.WRITE)
		file.store_string(read_file_text)
		file.close()
		
		
		get_tree().change_scene_to_file("res://scenes.tscn")
			
	if(player_hp <= 0):
		var file = FileAccess.open("res://Saves/defSave.txt", FileAccess.READ)
		var read_file_text = file.get_as_text()
		file.close()
		
		file = FileAccess.open("res://Saves/save.txt", FileAccess.WRITE)
		file.store_string(read_file_text)
		file.close()
		
		get_tree().change_scene_to_file("res://Menu.tscn")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(player_hp == 0):
		get_tree().change_scene_to_file("res://scenes.tscn")
	
	pass

extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("num_1"):
		$EnemyHpBar/Bar.value = 0
		OS.delay_msec(10)
		get_tree().change_scene_to_file("res://scenes.tscn")
	
	
	pass

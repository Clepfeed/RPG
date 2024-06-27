extends Area2D

@export var where_to_go = "Location_2"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	var newScene = "res://" + where_to_go + ".tscn"
	
	get_tree().change_scene_to_file(newScene)
	pass # Replace with function body.

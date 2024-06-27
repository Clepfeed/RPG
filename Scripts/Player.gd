extends Area2D

@export var speed = 500; #скорость
@export var max_hp = 100
@export var hp = max_hp
@export var mana = 100
var screen_size;

@export var released_delay = 4;
var left_but_released_delay = 0;
var right_but_released_delay = 0;
var up_but_released_delay = 0;
var down_but_released_delay = 0;


# Called when the node enters the scene tree for the first time.
func _ready():
	var file = FileAccess.open("Saves/hp.txt", FileAccess.READ)
	var read_hp = file.get_as_text()
	hp = float(read_hp)
	
	$BarDisplay/Bar.max_value = max_hp;
	screen_size = get_viewport_rect().size
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += released_delay
	if Input.is_action_pressed("move_left"):
		velocity.x -= released_delay
	if Input.is_action_pressed("move_down"):
		velocity.y += released_delay
	if Input.is_action_pressed("move_up"):
		velocity.y -= released_delay
		
	if Input.is_action_just_released("move_right"):
		right_but_released_delay = 0
	if Input.is_action_just_released("move_left"):
		left_but_released_delay = 0
	if Input.is_action_just_released("move_up"):
		up_but_released_delay = 0
	if Input.is_action_just_released("move_down"):
		down_but_released_delay = 0
	
	if right_but_released_delay < released_delay:
		velocity.x += 1
		right_but_released_delay += 1
	if left_but_released_delay < released_delay:
		velocity.x -= 1
		left_but_released_delay += 1
	if up_but_released_delay < released_delay:
		velocity.y -= 1
		up_but_released_delay += 1
	if down_but_released_delay < released_delay:
		velocity.y += 1
		down_but_released_delay += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	position += velocity * delta
	
	$BarDisplay/Bar.value = hp;
	pass

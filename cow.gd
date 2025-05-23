extends CharacterBody2D

var sucked_up = false
var value = 5
var init_pos

func _ready() -> void:
	init_pos = position

func _physics_process(delta: float) -> void:
	print(init_pos, position)
	if position != init_pos:
		pass
	if sucked_up == true:
		velocity.y = -120
	if sucked_up == false and position != init_pos:
		velocity.y = 120
	if sucked_up == false and position == init_pos:
		velocity.y = 0
	move_and_slide()

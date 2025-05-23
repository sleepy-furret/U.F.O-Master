extends CharacterBody2D

@onready var shadow: Sprite2D = $shadow

var sucked_up = false
var value = 5
var init_pos
var strengh_nedded = 1

@export var suckaplable_data: SuckapableData

func _ready() -> void:
	init_pos = global_position

func _physics_process(delta: float) -> void:
	shadow.global_position.y = init_pos.y + 20
	shadow.global_position.x = init_pos.x
	
	
	if suckaplable_data.sucked_up == true:
		velocity.y = -40
	if suckaplable_data.sucked_up == false and global_position.y < init_pos.y:
		velocity.y = 80
	if suckaplable_data.sucked_up == false and global_position.y >= init_pos.y:
		velocity.y = 0
	move_and_slide()

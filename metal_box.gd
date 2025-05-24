extends CharacterBody2D

@export var suckaplable_data: SuckapableData
@onready var shadow: Sprite2D = $shadow

var init_pos

func _ready() -> void:
	init_pos = global_position

func _physics_process(delta: float) -> void:
	shadow.global_position.y = init_pos.y
	shadow.global_position.x = init_pos.x
	
	
	if suckaplable_data.sucked_up == true:
		velocity.y = -40
	if suckaplable_data.sucked_up == false and global_position.y < init_pos.y:
		velocity.y = 80
	if suckaplable_data.sucked_up == false and global_position.y >= init_pos.y:
		velocity.y = 0
	move_and_slide()

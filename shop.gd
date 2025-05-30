extends Node2D

@onready var money: Label = $shop_ui/money
@onready var speed: Label = $shop_ui/speed
@onready var speed_button: TextureButton = $shop_ui/speed_button
@onready var speed_button_txt: Label = $shop_ui/speed_button_txt
@onready var strengh: Label = $shop_ui/strengh
@onready var strengh_button: TextureButton = $shop_ui/strengh_button
@onready var strengh_button_txt: Label = $shop_ui/strengh_button_txt
@onready var end: Label = $shop_ui/end
@onready var end_button: TextureButton = $shop_ui/end_button
@onready var end_button_txt: Label = $shop_ui/end_button_txt

var speed_cost = 5
var speed_increase
var times_speed_is_bought = 0

var strengh_cost = 5
var strengh_increase
var times_strengh_is_bought = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	speed_increase = round((Global.speed / (times_speed_is_bought + 1)) / 5)
	speed_cost = 5 * (times_speed_is_bought + 1)
	strengh_increase = 1
	strengh_cost = 10 * (times_strengh_is_bought + 1)
	
	
	money.text = "Money: " + str(Global.money)
	speed.text = "Increase Speed \n Cost: " + str(speed_cost) + "\n Current Speed: " + str(Global.speed) + "\n Speed Increased: " + str(speed_increase)
	strengh.text = "Increase Strengh \n Cost: " + str(strengh_cost) + "\n Current Strengh: " + str(Global.strengh) + "\n Strengh Increased: " + str(strengh_increase)
	

func _on_return_button_down() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
	#queue_free()
	#get_parent().get_parent().ufo.stop_player = false
	#get_parent().get_parent().in_shop = false


func _on_speed_button_button_down() -> void:
	if speed_cost <= Global.money and times_speed_is_bought <= 5:
		times_speed_is_bought += 1
		Global.speed += speed_increase
		Global.money -= speed_cost
	elif times_speed_is_bought > 5:
		speed_button_txt.text = "Sold Out"


func _on_strengh_button_button_down() -> void:
	if strengh_cost <= Global.money and times_strengh_is_bought <= 5:
		times_strengh_is_bought += 1
		Global.strengh += strengh_increase
		Global.money -= strengh_cost
	elif times_strengh_is_bought > 5:
		strengh_button_txt.text = "Sold Out"


func _on_end_button_button_down() -> void:
	if Global.money >= 200:
		print("GAME ENDED")

extends Node2D

@onready var price_label: Label = $"CanvasLayer/price label"
@onready var ufo: CharacterBody2D = $ufo
@onready var canvas_layer: CanvasLayer = $CanvasLayer

var ufo_in_scape_region = false
var in_shop = false

var shop = load("res://shop.tscn")

func _ready() -> void:
	ufo.stop_player = false
	in_shop = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	price_label.text = "Money: " + str(Global.money)
	if ufo_in_scape_region == true and Input.is_action_just_pressed("ui_accept") and in_shop == false:
		in_shop = true
		#var shop_instance = shop.instantiate()
		#canvas_layer.add_child(shop_instance)
		get_tree().change_scene_to_file("res://shop.tscn")
		ufo.stop_player = true


func _on_scape_region_area_entered(area: Area2D) -> void:
	ufo_in_scape_region = true


func _on_scape_region_area_exited(area: Area2D) -> void:
	ufo_in_scape_region = false

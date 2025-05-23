extends Node2D

@onready var price_label: Label = $"price label"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	price_label.text = "Money: " + str(Global.money)

extends CharacterBody2D

var speed = 250
var accel = 30
var strengh = 1

var stop_player = false

func _physics_process(delta: float) -> void:
	speed = Global.speed
	strengh = Global.strengh
	
	if stop_player == false:
		var direction = Input.get_vector("move_left","move_right","move_up","move_down")
		
		
		velocity.x = move_toward(velocity.x, speed * direction.x, accel)
		velocity.y = move_toward(velocity.y, speed * direction.y, accel)
		
		move_and_slide()
	





#
#func _on_ufo_area_area_exited(area: Area2D) -> void:
	#if area.is_in_group("suckupable"):
		#area.get_parent().sucked_up = false


func _on_ufo_area_inside_area_entered(area: Area2D) -> void:
	if area.is_in_group("suckupable") and area.get_parent().suckaplable_data.sucked_up == true:
		Global.money += area.get_parent().suckaplable_data.value
		area.get_parent().queue_free()


#func _on_ufo_area_sucking_area_area_entered(area: Area2D) -> void:
	#if area.is_in_group("suckupable"):
		#area.get_parent().sucked_up = true
		#
		#


func _on_ufo_area_sucking_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("suckupable"):
		area.get_parent().suckaplable_data.sucked_up = false
		
		


func _on_ufo_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("suckupable"):
		if area.get_parent().suckaplable_data.strengh_nedded <= strengh:
			area.get_parent().suckaplable_data.sucked_up = true
		
		

extends CharacterBody2D

const UP = Vector2(0,-1)
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = 800
var motion = Vector2()

func _physics_process(delta): 
	motion.y +=GRAVITY
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("Run")
	else:
		motion.x = 0
		$AnimatedSprite2D.play("idle")
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = -JUMP_HEIGHT 
			$AnimatedSprite2D.play("jump")
		
	set_velocity(motion)
	set_up_direction(UP)
	move_and_slide()
	motion = velocity
	
	if position.y >290:
		get_tree().change_scene_to_file("res://gameover.tscn")
	

	pass


func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	get_tree().change_scene_to_file("res://gameover.tscn")
	pass # Replace with function body.


func _on_area_2d_2_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	get_tree().change_scene_to_file("res://world2.tscn")
	pass # Replace with function body.

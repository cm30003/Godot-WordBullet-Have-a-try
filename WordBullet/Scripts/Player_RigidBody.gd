extends RigidBody2D

@export var speed = 200

func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO

	if Input.is_action_pressed("左"):
		direction.x -= 1
	if Input.is_action_pressed("右"):
		direction.x += 1
	if Input.is_action_pressed("上"):
		direction.y -= 1
	if Input.is_action_pressed("下"):
		direction.y += 1

	direction = direction.normalized()
	linear_velocity = direction * speed

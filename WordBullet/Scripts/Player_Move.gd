extends Node2D

var speed=200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if Input.is_action_pressed("上"):
		#position.y-=delta*speed
	#elif Input.is_action_pressed("下"):
		#position.y+=delta*speed
		#
	#if Input.is_action_pressed("左"):
		#position.x-=delta*speed
	#elif Input.is_action_pressed("右"):
		#position.x+=delta*speed
		#
	position+=Input.get_vector("左","右","上","下")*speed*delta

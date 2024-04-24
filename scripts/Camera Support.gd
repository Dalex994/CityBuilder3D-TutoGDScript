extends Node3D

# displacement speed
@export var speed = 6
# margin to start the displacement
@export var margin = 15

func _physics_process(delta):
	var pos = get_viewport().get_mouse_position()
	var window_size = get_viewport().get_visible_rect().size
	
	# if mouse is close to the window border => movement
	if pos.x < margin:
		translate(Vector3.LEFT * speed * delta) 
	if pos.x > window_size.x - margin:
		translate(Vector3.RIGHT * speed * delta)
	if pos.y < margin:
		translate(Vector3.FORWARD * speed * delta) 
	if pos.y > window_size.y - margin:
		translate(Vector3.BACK * speed * delta)

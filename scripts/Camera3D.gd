extends Camera3D

var zoom_speed = 5
var minFov = 20
var maxFov = 90

func _input(event):
	# zoom handling
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and get_fov() > minFov:
			set_fov(get_fov() - zoom_speed)
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN and get_fov() < maxFov:
			set_fov(get_fov() + zoom_speed)

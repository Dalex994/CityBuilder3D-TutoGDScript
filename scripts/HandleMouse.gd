extends StaticBody3D

# Marker case
var marker
var pos = Vector3()
var compensate = 20 # the grid is centered in 0,0

# Marker recuperation
func _ready():
	marker = get_node("/root/Game/Marker")
	


func _on_input_event(camera, event, position, normal, shape_idx):
	# X/Y Grid position 
	var posX = round(position.x) + 0.5
	var posY = round(position.z) + 0.5
	marker.transform.origin = Vector3(posX, 0, posY) # Place Marker on the corresponding case on mouse
	
	# Clicked grid case calculation
	var vector = Vector2(round(position.x) + compensate, round(position.z) + compensate)
	var grid_position = vector.x + (vector.y * 40)
	# print(grid_position) # DEBUG
	
	# Mouse left click detection
	if Input.is_action_just_pressed("left_click"):
		print("Building Creation at " + str(marker.transform.origin)) #DEBUG
		pos = Vector3(posX, 0.2, posY)
		BuildingsManager.create_building(pos, grid_position)

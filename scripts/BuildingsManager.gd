extends Node

# Buildings List
var building_1 = "assets/buildings/building.tscn"
var building_2 = "assets/buildings/building_info.tscn"

var grid_data = [] # 40*40 = 1600 fictives cases of the map grid

func _ready():
	for i in range(1600):
		grid_data.append(0) # 0 = empty grid case

func create_building(position, grid_position):
	
	if grid_data[grid_position] != 1:
		# Building selected
		print("Nothing on... Built")	#DEBUG
		var building_res = load(building_2)
		var building = building_res.instantiate()
		get_tree().get_root().add_child(building)
		building.global_position = position
		grid_data[grid_position] = 1		# It tells that the occupied case and all marge 
		grid_data[grid_position + 1] = 1	# around of 1 is occupied (except the corners, must improve this...)
		grid_data[grid_position - 1] = 1
		grid_data[grid_position + 40] = 1 
		grid_data[grid_position - 40] = 1	#TODO: Improve this ugly but working code 
	else:
		print("Occupied") #DEBUG

extends Node

# Buildings List
var building_info = "assets/buildings/building_info.tscn"
var building_clean = "assets/buildings/building_clean.tscn"
var building_repair = "assets/buildings/building_repair.tscn"
var building_toilet = "assets/buildings/building_toilet.tscn"
var building_wheel = "assets/buildings/wheel.tscn"
var building_tower = "assets/buildings/tower.tscn"
var building_swing = "assets/buildings/swing_3.tscn"
var building_circus = "assets/buildings/circus.tscn"
var building_sitswing = "assets/buildings/sit_swing.tscn"

# 40*40 = 1600 fictives cases of the map grid
var grid_data = [] 

var selected_building = 10
var building_price = 0

func _ready():
	for i in range(1600):
		grid_data.append(0) # 0 = empty grid case
		
func get_selected_building():
	if selected_building == 1:
		return building_info
	if selected_building == 2:
		return building_clean
	if selected_building == 3:
		return building_repair
	if selected_building == 4:			#TODO: upgrade it with a switch ^^
		return building_toilet
	if selected_building == 5:
		return building_wheel
	if selected_building == 6:
		return building_tower
	if selected_building == 7:
		return building_swing
	if selected_building == 8:
		return building_circus
	if selected_building == 9:
		return building_sitswing
		
	print(selected_building)


func create_building(position, grid_position):
	
	if PlayerData.money >= building_price and grid_data[grid_position] != 1:
		# Building selected
		print("Nothing on... Built")	#DEBUG
		var building_res = load(get_selected_building())
		var building = building_res.instantiate()
		get_tree().get_root().add_child(building)
		building.global_position = position
		grid_data[grid_position] = 1		# It tells that the occupied case and all marge 
		grid_data[grid_position + 1] = 1	# around of 1 is occupied (except the corners, must improve this...)
		grid_data[grid_position - 1] = 1
		grid_data[grid_position + 40] = 1 
		grid_data[grid_position - 40] = 1	#TODO: Improve this ugly but working code 
		
		PlayerData.money -= building_price
		PlayerData.set_money()
	else:
		print("Occupied") #DEBUG

extends MeshInstance3D

# define the money rent of each attractions. Replicable to any attraction

@export var entry_price = 2
@export var attraction_time = 10
@export var places_number = 20

var tourists_number = randi() % places_number #TODO: random for test but must to tweak 
								   # with real number of tourists.


func _on_timer_timeout():
	get_money()
	$Timer.wait_time = attraction_time
	
func get_money():
	PlayerData.money += entry_price * tourists_number
	PlayerData.set_money()

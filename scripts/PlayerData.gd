extends Node

#player money
var money = 100

#display the variable into the UI Node
func set_money():
	var label = get_tree().get_root().find_child("CoinAmount")
	label.text = var_to_str(money)

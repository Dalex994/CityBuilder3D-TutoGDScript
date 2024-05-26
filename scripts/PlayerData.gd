extends Node

#player money
var money = 100


#actualize the variable into the UI Node
func set_money():
	GUI.coin_amount.text = str(money)

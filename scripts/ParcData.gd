extends Node

var entrance_price = 0.5
var nb_visitors = 10
var max_nb_visitors = 100
var fun = 0
var service = 0
var people = 10

func set_people():
	GUI.people_amount.text = str(people)

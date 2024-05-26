extends CharacterBody3D

@export_category("Misc")
@export var money_v = 100
@export var time = 60
@export var courage = 3

@export_category("Auto-Movement")
@export var speed = 2
var target = null
var velocyty = Vector3.ZERO
var node

func _ready():
	node = get_node("/root/Game/BuildingInfo")
	target = node.transform.origin
	
func _physics_process(delta):
	if target:
		look_at(target, Vector3.UP)
		velocyty = -transform.basis.z * speed
		if transform.origin.distance_to(target) < 2:
			target = null
			velocyty = Vector3.ZERO
	velocyty = move_and_slide()

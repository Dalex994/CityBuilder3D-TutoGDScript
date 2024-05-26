extends MeshInstance3D

func _ready():
	random_anim("x")
	$AnimationPlayer.animation_finished.connect(self.random_anim)
	
func random_anim(x):
	print(x)
	$AnimationPlayer.stop()
	var anim_to_play = $AnimationPlayer.get_animation("anim")
	#anim_to_play.loop_mode = Animation.LOOP_LINEAR
	$AnimationPlayer.speed_scale = randf_range(0.2, 0.35) #randomization to smooth the animation		
	# Random time between animations
	var time = randf_range(0.15, 1.5)
	await get_tree().create_timer(time).timeout
	$AnimationPlayer.play("anim")

extends Node2D

var next_action = 'ui_left'

func _ready():
	$Controls.show_control('left')

func _process(delta):
	if (Input.is_action_just_pressed(next_action)):
		if (next_action == 'ui_right'):
			next_action = 'ui_left'
			$Controls.show_control('left')
		else:
			next_action = 'ui_right'
			$Controls.show_control('right')
		HandGlobal.score += 1
		$AnimationPlayer.play('rub')

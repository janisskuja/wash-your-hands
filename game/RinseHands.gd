extends Area2D

func _process(delta):
	if (Input.is_action_pressed("ui_left") and position.x > 340):
		set_position(Vector2(position.x - 1, position.y))

func _on_RinseHands_body_entered(body):
	if (body.is_in_group('drop')):
		body.queue_free()
		HandGlobal.score += 1

extends Node2D

func _process(delta):
    if (Input.is_action_pressed('ui_left') and $RightHand.position.x > 0):
        $RightHand.set_position(Vector2($RightHand.position.x - 1, $RightHand.position.y))
    if (Input.is_action_pressed('ui_right') and $LeftHand.position.x < 0):
        $LeftHand.set_position(Vector2($LeftHand.position.x + 1, $LeftHand.position.y))


func _on_Towel_area_entered(area):
    if (area.is_in_group('hands')):
        HandGlobal.score += 10

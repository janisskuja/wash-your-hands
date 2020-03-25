extends Node2D

const Droplet = preload('res://Droplet.tscn')
var step = 1

func _process(delta):
    if (Input.is_action_pressed("ui_down") and $PressHand.position.y < 40):
        $PressHand.set_position(Vector2($PressHand.position.x, $PressHand.position.y + 1))
    elif (Input.is_action_pressed("ui_up") and $PressHand.position.y > -1):
        $PressHand.set_position(Vector2($PressHand.position.x, $PressHand.position.y - 1))
    if (Input.is_action_pressed("ui_left") and $SoapHand.position.x > 180):
        $SoapHand.set_position(Vector2($SoapHand.position.x - 1, $SoapHand.position.y))

func _on_PressHere_area_entered(area):
    if (area.is_in_group('hands')):
        $SoapDp1.set_visible(false)
        $SoapDp2.set_visible(true)
        var droplet = Droplet.instance()
        droplet.type = 'soap'
        $SoapSpawn.call_deferred('add_child', droplet)


func _on_PressHere_area_exited(area):
    if (area.is_in_group('hands')):
        $SoapDp1.set_visible(true)
        $SoapDp2.set_visible(false)


func _on_SoapHand_body_entered(body):
    if (body.is_in_group('drop')):
        step += 1
        if (step == 2):
            $SoapHand/Step1.set_visible(false)
            $SoapHand/Step2.set_visible(true)
        elif (step == 3):
            $SoapHand/Step2.set_visible(false)
            $SoapHand/Step3.set_visible(true)
        body.queue_free()
        HandGlobal.score += 10

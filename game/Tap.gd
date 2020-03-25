extends Node2D

const Droplet = preload('res://Droplet.tscn')

var closing_tap = false

func set_closing_tap():
    closing_tap = true
    $PressHand.set_visible(true)
    
func _process(delta):
    if (Input.is_action_pressed("ui_down") and $PressHand.position.y < 140 and closing_tap):
        $PressHand.set_position(Vector2($PressHand.position.x, $PressHand.position.y + 1))

func stop_spawning():
    $Timer.stop()

func start_spawning():
    $Timer.start()

func _on_Timer_timeout():
    var droplet = Droplet.instance()
    $WaterSpawn.call_deferred('add_child', droplet)

func _on_PressHere_area_entered(area):
    stop_spawning()
    $Timer2.start()

func _on_Timer2_timeout():
    HandGlobal.score += 10

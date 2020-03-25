extends Node2D

var destination
var random_num
var modifier = 1

func _ready():
    random_num = rand_range(1, 801)
    
    if (random_num / 2 < 400):
        modifier = -1

    destination = Vector2(modifier * random_num, -640)
    if (random_num < 266):
        $Bubble_1.set_visible(true)
    elif (random_num < 533):
        $Bubble_2.set_visible(true)
    else:
        $Bubble_3.set_visible(true)

func _process(delta):
    position = position.linear_interpolate(destination, delta * 0.4)

func _on_Timer_timeout():
    queue_free()

extends RigidBody2D


export (String, 'water', 'soap') var type = 'water'


# Called when the node enters the scene tree for the first time.
func _ready():
    if (type == 'water'):
        var random_water = randi()%4+1
        if random_water == 1:
            $Water_1.set_visible(true)
        elif random_water == 2:
            $Water_2.set_visible(true)
        else:
            $Water_3.set_visible(true)
        pass
    if (type == 'soap'):
        $Soap.set_visible(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if position.y > 800:
        queue_free()

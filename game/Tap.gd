extends Node2D

const Droplet = preload('res://Droplet.tscn')

func stop_spawning():
    $Timer.stop()

func start_spawning():
    $Timer.start()

func _on_Timer_timeout():
    var droplet = Droplet.instance()
    $WaterSpawn.call_deferred('add_child', droplet)

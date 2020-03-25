extends Control

func _process(delta):
    $Score.text = 'SCORE: ' + str(HandGlobal.score)

extends Control

func _ready():
    $VBoxContainer/Score.text = str(HandGlobal.score)

func _on_Again_pressed():
    HandGlobal.score = 0
    get_tree().change_scene('res://Game.tscn')

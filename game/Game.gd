extends Node2D

const SoapDispenser =  preload('res://SoapDispenser.tscn')

var hands_wet = false
var hands_soaped = false

var soap_dispenser

func _ready():
	soap_dispenser = SoapDispenser.instance()
	$AnimationPlayer.play('wet_your_hands_txt')
	

func _process(delta):
	if (HandGlobal.score >= 20 and hands_wet == false):
		hands_wet = true
		$RinseHands.queue_free()
		$Tap.queue_free()
		$CanvasLayer/HUD/TaskList/WetHands/Check.set_visible(true)
		$AnimationPlayer.play('apply_soap_txt')
		soap_dispenser.set_position(Vector2(240, 450))
		add_child(soap_dispenser)
	elif (HandGlobal.score >= 50 and hands_soaped == false):
		hands_soaped = true
		$CanvasLayer/HUD/TaskList/ApplySoap/Check.set_visible(true)
		$AnimationPlayer.play('spread_it_txt')
		soap_dispenser.queue_free()

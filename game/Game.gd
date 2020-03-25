extends Node2D

const SoapDispenser =  preload('res://SoapDispenser.tscn')
const RubHands =  preload('res://RubHands.tscn')

var hands_wet = false
var hands_soaped = false
var hands_rubbed = false
var between_fingers_done = false
var closed_fists = false
var thumbs_screwed = false
var palms_rubbed = false
var hands_rinsed = false
var hands_dried = false
var tap_closed = false
var hands_moisturized = false

var soap_dispenser
var rub_hands

var step = 1

func _ready():
    soap_dispenser = SoapDispenser.instance()
    rub_hands = RubHands.instance()
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
        step += 1
    elif (HandGlobal.score >= 50 and hands_soaped == false):
        hands_soaped = true
        $CanvasLayer/HUD/TaskList/ApplySoap/Check.set_visible(true)
        $AnimationPlayer.play('spread_it_txt')
        soap_dispenser.queue_free()
        add_child(rub_hands)
        $Timer.start()
    elif (step == 3 and !hands_rubbed):
        hands_rubbed = true
        $CanvasLayer/HUD/TaskList/RubHands/Check.set_visible(true)
        rub_hands.set_step('updown')
        $AnimationPlayer.play('between_fingers_txt')
        $Timer.start()
    elif (step == 4 and !between_fingers_done):
        between_fingers_done = true
        rub_hands.set_step('palm_to_palm')
        $CanvasLayer/HUD/TaskList/InterlacedFingers/Check.set_visible(true)
        $AnimationPlayer.play('palm_to_palm_txt')
        $Timer.start()
    elif (step == 5 and !closed_fists):
        closed_fists = true
        rub_hands.set_step('closed_fists')
        $CanvasLayer/HUD/TaskList/PalmToPalmFingers/Check.set_visible(true)
        $AnimationPlayer.play('way_of_the_closed_fists_txt')
        $Timer.start()
    elif (step == 6 and !thumbs_screwed):
        thumbs_screwed = true
        $CanvasLayer/HUD/TaskList/BacksOfFingers/Check.set_visible(true)
        rub_hands.set_step('thumb_screw')
        $AnimationPlayer.play('screw_the_thumbs_txt')
        $Timer.start()
    elif (step == 7 and !palms_rubbed):
        palms_rubbed = true
        $CanvasLayer/HUD/TaskList/ScrewThumbs/Check.set_visible(true)
        rub_hands.set_step('palm_rub')
        $AnimationPlayer.play('palm_rub_txt')
        $Timer.start()
    elif (step == 8 and !hands_rinsed):
        hands_rinsed = true
        $CanvasLayer/HUD/TaskList/RubPalms/Check.set_visible(true)


func _on_Timer_timeout():
    step += 1

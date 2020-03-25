extends Node2D

var next_action = 'ui_left'
var current_anim = 'rub'

var current_step
const Bubble = preload('res://Bubble.tscn')

func _ready():
    $Controls.show_control('left')

func set_step(step):
    current_step = step
    if (step == 'updown'):
        $hand_step_1_left.set_visible(false)
        $hand_step_1_right.set_visible(false)
        $Updown1.set_visible(true)
        current_anim = 'updown'
        next_action = 'ui_up'
        $Controls.show_control('up')
        $Timer.start()
    if (step == 'palm_to_palm'):
        $Updown2.set_visible(false)
        $PalmToPalm.set_visible(true)
        current_anim = 'palm_to_palm'
        next_action = 'ui_left'
        $Controls.show_control('left')
    if (step == 'closed_fists'):
        $PalmToPalm.set_visible(false)
        $ClosedFists.set_visible(true)
        current_anim = 'closed_fists'
        next_action = 'ui_up'
        $Controls.show_control('up')
    if (step == 'thumb_screw'):
        $ClosedFists.set_visible(false)
        $ThumbScrew.set_visible(true)
        current_anim = 'thumb_screw'

func _process(delta):
    if (Input.is_action_just_pressed(next_action)):
        if (next_action == 'ui_right'):
            next_action = 'ui_left'
            $Controls.show_control('left')
        elif (next_action == 'ui_left'):
            next_action = 'ui_right'
            $Controls.show_control('right')
        elif (next_action == 'ui_up'):
            next_action = 'ui_down'
            $Controls.show_control('down')
        elif (next_action == 'ui_down'):
            next_action = 'ui_up'
            $Controls.show_control('up')
        var bubble = Bubble.instance()
        $BubbleSpawn.call_deferred('add_child', bubble)
        HandGlobal.score += 1
        $AnimationPlayer.play(current_anim)


func _on_Timer_timeout():
    if (current_step == 'updown'):
        $Updown1.set_visible(false)
        $Updown2.set_visible(true)
        current_anim = 'updown_2'
    elif (current_step == ''):
        current_anim = 'thumb_screw_2'

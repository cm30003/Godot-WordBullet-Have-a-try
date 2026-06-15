extends Control

@onready var windows = [
	$Character_Window,
	$Chat_Window,
	$Bullet_Window,
	$Describe_Window
]

var target_positions = []
var anim_duration = 0.6

func _ready():
	for w in windows:
		target_positions.append(w.position)

	var screen_size = get_viewport().get_visible_rect().size

	windows[0].position.y -= screen_size.y
	windows[1].position.x += screen_size.x
	windows[2].position.x -= screen_size.x
	windows[3].position.y += screen_size.y

	play_entry_sequence()

func play_entry_sequence():
	for i in range(windows.size()):
		var tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
		tween.tween_property(windows[i], "position", target_positions[i], anim_duration)
		await tween.finished

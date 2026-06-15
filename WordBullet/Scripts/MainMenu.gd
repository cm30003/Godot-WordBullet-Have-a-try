extends CanvasLayer

@onready var menu_panel = $MenuPanel
@onready var buttons = $MenuPanel/VBoxContainer.get_children()

func _ready():
	# 隐藏菜单面板
	menu_panel.hide()
	# 设置所有按钮的缩放中心点，并连接按下/松开信号
	for btn in buttons:
		btn.pivot_offset = btn.size / 2
		btn.button_down.connect(_on_button_down.bind(btn))
		btn.button_up.connect(_on_button_up.bind(btn))
	
	# 连接四个按钮的点击信号
	$MenuPanel/VBoxContainer/NewGame.pressed.connect(_on_new_game_pressed)
	$MenuPanel/VBoxContainer/Continue.pressed.connect(_on_continue_pressed)
	$MenuPanel/VBoxContainer/Settings.pressed.connect(_on_settings_pressed)
	$MenuPanel/VBoxContainer/Quit.pressed.connect(_on_quit_pressed)

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		# 切换菜单可见性：可见 ↔ 隐藏
		menu_panel.visible = not menu_panel.visible
		get_viewport().set_input_as_handled()

func _on_button_down(btn):
	# 按钮按下：缩小至 90%，颜色变暗
	var tween = create_tween().set_trans(Tween.TRANS_SINE)
	tween.parallel().tween_property(btn, "scale", Vector2(0.9, 0.9), 0.08)
	tween.parallel().tween_property(btn, "modulate", Color(0.6, 0.6, 0.6), 0.08)

func _on_button_up(btn):
	# 按钮松开：恢复原大小和颜色
	var tween = create_tween().set_trans(Tween.TRANS_SINE)
	tween.parallel().tween_property(btn, "scale", Vector2(1.0, 1.0), 0.1)
	tween.parallel().tween_property(btn, "modulate", Color(1, 1, 1), 0.1)

func _on_new_game_pressed():
	print("\u65B0\u6E38\u620F")

func _on_continue_pressed():
	print("\u7EE7\u7EED\u6E38\u620F")

func _on_settings_pressed():
	print("\u8BBE\u7F6E")

func _on_quit_pressed():
	get_tree().quit()

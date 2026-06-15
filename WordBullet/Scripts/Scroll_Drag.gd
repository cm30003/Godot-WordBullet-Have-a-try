extends ScrollContainer

# 是否正在拖拽中
var dragging = false
# 拖拽开始时鼠标的 Y 坐标
var drag_start_y = 0
# 拖拽开始时滚动条的 Y 位置
var scroll_start_y = 0

func _gui_input(event):
	# 检测鼠标按钮事件
	if event is InputEventMouseButton:
		# 左键按下：开始拖拽
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				dragging = true
				drag_start_y = event.global_position.y
				scroll_start_y = scroll_vertical
			# 左键松开：停止拖拽
			else:
				dragging = false

	# 拖拽中移动鼠标：计算位移并更新滚动位置
	if event is InputEventMouseMotion and dragging:
		var delta_y = drag_start_y - event.global_position.y
		scroll_vertical = scroll_start_y + delta_y

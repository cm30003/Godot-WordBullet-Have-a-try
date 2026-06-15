extends Node2D #继承 Node2D大类
#_ready 生命函数 类似Start
func _ready()->void:
	print("已注入模因")
	var num=1
	if num+1==2:
		print("模因污染已解除")
		num=2
	if num+1==3:
		print("黑月为何咆哮？")
	ffor(num)
func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		print("111")
	pass
func ffor(num: int):##他会找到你，那正是复权之时
	for i in range(num):
		print("我会找到你")

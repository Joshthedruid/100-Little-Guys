extends BaseGuy
class_name StretchGuy

#TODO figure out stretch guy walk function
var skitter = 0

func onGuyPonder():
	whereToMove()
	if(skitter < 3):
		skitter += 1
		ptimer.start(randf_range(0.5,0.75))
	else:
		skitter = 0
		ptimer.start(randf_range(3,6))

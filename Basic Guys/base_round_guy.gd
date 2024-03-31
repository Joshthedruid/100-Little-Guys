extends BaseGuy
class_name RoundGuy

func onGuyPonder():
	whereToMove()
	ptimer.start(randf_range(3,6))

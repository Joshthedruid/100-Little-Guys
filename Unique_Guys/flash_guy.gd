extends StretchGuy

#note, this guy is using a pretty direct dupe of the base function, if that significantly changes this will need updating

var flashspeed = 0

func onGuyPonder():
	whereToMove()
	if(skitter < 3):
		skitter += 1
		ptimer.start(randf_range(0.5 - flashspeed,0.75 - (flashspeed * 1.5)))
	else:
		skitter = 0
		if flashspeed > 0.4:
			flashspeed += 0.04
		ptimer.start(randf_range(3 - (flashspeed * 4),6 - (flashspeed * 8)))

#note, basically all numbers for flashspeed are free to tweak

extends RoundGuy

func whereToMove():
	var inputA = randi_range(-1,1)
	var inputB = randi_range(-1,1)
	if(inputA<0):
		move(Vector2.LEFT)
	if(inputB<0):
		move(Vector2.DOWN)
	elif(inputB>0):
		move(Vector2.UP)

#this is a super subtle change, nothing is different from the parent function except the move right line is deleted

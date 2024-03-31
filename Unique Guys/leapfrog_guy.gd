extends StretchGuy

#TODO make leapfrog_guy detect when the space on the other side of the guy is clear
#TODO figure out a cooldown maybe?  so leapfrog_guy doesn't just harrass the same guy
#TODO confirm what he does when there's two jump options and handle the edge case (should be handled by eightDirections.shuffle but should test to double check)
#TODO as written, the move script is decoupled from the parent object.  Best fix is probably to change the move code to its own function (also it's the wrong movement for stretch guy anyway)
#TODO setting unique names for this guy does not work due to inheritance, gotta find the correct way to do it

#TODO as of 3/27/24, guy can in fact leapfrog!  but he also hops over walls and doesn't detect if there's a free space for him on the other side yet.  Also cooldown is probably a good idea?

#var guy_name = "Leapfrog"
#var guy_ID = 1

var iJumped = false

var eightDirections = [Vector2.LEFT, Vector2.LEFT + Vector2.UP, Vector2.UP, Vector2.UP + Vector2.RIGHT, Vector2.RIGHT, Vector2.RIGHT + Vector2.DOWN, Vector2.DOWN, Vector2.DOWN + Vector2.LEFT]

func sense():
	eightDirections.shuffle()
	for dir in eightDirections:
		if(!iJumped):
			ray.target_position = dir * tile_size
			ray.force_raycast_update()
			ray.add_exception($Walls)
			if ray.is_colliding():
				#ray.target_position = dir * tile_size * 2
				#ray.force_raycast_update()
				#ray.clear_exceptions()
				#if !ray.is_colliding():
				position += dir * tile_size * 2
				iJumped = true

func onGuyPonder():
	iJumped = false
	sense()
	if(!iJumped):
		var inputA = randi_range(-1,1)
		var inputB = randi_range(-1,1)
		if(inputA<0):
			move(Vector2.LEFT)
		elif(inputA>0):
			move(Vector2.RIGHT)
		if(inputB<0):
			move(Vector2.DOWN)
		elif(inputB>0):
			move(Vector2.UP)
		ptimer.start(randf_range(3,6))

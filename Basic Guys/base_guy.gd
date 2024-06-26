extends CharacterBody2D
class_name BaseGuy

#TODO: pause all other guy functions besides being clicked and dragged while it's being clicked and dragged
#TODO: return to regular movement when dropped
#TODO: prevent guys from being picked up by being dragged over
#TODO: handle guys being dropped outside of the play area
#TODO: (not for base guy but) figure out how to center the play area in fullscreen

#constant which dictates the side of the tiles
var tile_size = 11

var guy_name = "DEBUG NAME"
var guy_ID = -1

#connecting the in-scene timer and raycast
@onready var ptimer = $PonderTimer
@onready var ray = $RayCast2D

#on start snap to position and start the ponder timer
func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position.x += (tile_size/2) - 1
	position.y += 1
	ptimer.start(randf_range(3,6))

#allows movement, only if no collision is detected
func move(dir):
	ray.target_position = dir * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += dir * tile_size

func whereToMove():
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

var canDrag = false

func _on_area_2d_mouse_entered():
	canDrag = true

func _on_area_2d_mouse_exited():
	canDrag = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("click") && canDrag:
		global_position = get_global_mouse_position()

func _on_ponder_timer_timeout():
	onGuyPonder()




#called when guy is being held
func onGuyHold():
	pass

#called when guy is dropped
func onGuyDrop():
	pass

#called after guy sits around for a little bit
func onGuyPonder():
	pass

#a second ponder for more complex behaviors
func onGuyPonder2():
	pass

#called when guy dies
func onGuyDie():
	pass

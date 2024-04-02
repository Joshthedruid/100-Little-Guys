extends Area2D

#TODO: GuyCan spawns a guy when clicked
#TODO: Decide whether when clicked, the guy can spawns a guy in your hand or on the field (probably field?)
#TODO: let the GuyCan reabsorb guys when dropped
#TODO: let the GuyCan reabsorb guys when killed
#TODO: Create datastructure for remembering which guys are in and not

#gets game area to add guys to
var gameArea = get_parent()

#makes an array to store guys
var guyArray = []

#loads a specific guy and adds it to the array
func addGuy(myString):
	var path = "res://Unique_Guys/" + myString
	var myGuy = load(path)
	guyArray.append(myGuy)

#adds a guy to the scene and removes it from the array
func spawnGuy():
	if(guyArray.size() > 0):
		guyArray.shuffle()
		var newGuy = guyArray.pop_back()
		gameArea.add_child(newGuy.instantiate())

# Called when the node enters the scene tree for the first time.
func _ready():
	#cloud of all 100 guys to add to array.  probably a better way to do this?
	addGuy("flash_guy.tscn")
	addGuy("leapfrog_guy.tscn")
	addGuy("leftbeard_guy.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

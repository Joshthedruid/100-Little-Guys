extends Node2D

var mySlot = preload("res://guy_box_slot.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for x in 10:
		for y in 10:
			var instance = mySlot.instantiate()
			instance.position.x += x*10 + 9
			instance.position.y += y*10 + 9
			add_child(instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

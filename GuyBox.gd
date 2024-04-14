extends Node2D

var mySlot = preload("res://guy_box_slot.tscn")

var digitArray = [preload("res://Play Area Sprites/Digits/0.png"),
preload("res://Play Area Sprites/Digits/1.png"),
preload("res://Play Area Sprites/Digits/2.png"),
preload("res://Play Area Sprites/Digits/3.png"),
preload("res://Play Area Sprites/Digits/4.png"),
preload("res://Play Area Sprites/Digits/5.png"),
preload("res://Play Area Sprites/Digits/6.png"),
preload("res://Play Area Sprites/Digits/7.png"),
preload("res://Play Area Sprites/Digits/8.png"),
preload("res://Play Area Sprites/Digits/9.png")]

# Called when the node enters the scene tree for the first time.
func _ready():
	for x in 10:
		for y in 10:
			var tenSprite = Sprite2D.new()
			var oneSprite = Sprite2D.new()
			oneSprite.texture = digitArray[x]
			tenSprite.texture = digitArray[y]
			oneSprite.position.x += x*10 + 12
			oneSprite.position.y += y*10 + 7
			tenSprite.position.x += x*10 + 6
			tenSprite.position.y += y*10 + 6
			add_child(oneSprite)
			add_child(tenSprite)
			var instance = mySlot.instantiate()
			instance.position.x += x*10 + 9
			instance.position.y += y*10 + 9
			add_child(instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

extends Node

const SPAWN_TIME = .2
const WATER = preload("res://Entities/Water.tscn")

const RED = preload("res://Sprites/red.png")
const GREEN = preload("res://Sprites/green.png")
const BLUE = preload("res://Sprites/blue.png")

var active = false
var timer

var water

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if active:
		timer -= delta
		if timer < 0:
			water = WATER.instantiate()
			get_parent().add_child(water)
			water.global_position = get_viewport().get_mouse_position()
			water.get_node("Sprite2D").set_texture(RED)
			timer = SPAWN_TIME
		

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			active = event.pressed
			timer = -1

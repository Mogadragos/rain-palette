extends AnimatableBody2D

const SPEED = 800.0

const MACHINE_WIDTH = 200.0

var bounds_left = 0
var bounds_right = 0
var velocity_x = 0

func _on_ready():
	var view = get_viewport_rect().size / 2
	var half_width = $Sprite2D.texture.get_size().x / 2
	bounds_left = half_width - view.x
	bounds_right = view.x - half_width - MACHINE_WIDTH

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity_x = direction * SPEED * delta
	else:
		velocity_x = move_toward(velocity_x, 0, SPEED)

	global_position.x = clamp(global_position.x + velocity_x, bounds_left, bounds_right)

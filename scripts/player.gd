extends CharacterBody2D
@export var speed: int = 5000
var direction_x: float = 0.0
@export var jump_strength: int = 200
@export var gravity:int = 800

func get_input() -> void:
	direction_x = Input.get_axis("left","right")
	if Input.is_action_just_pressed("jump"):
		velocity.y = -jump_strength
	if Input.is_action_just_pressed("shoot") and $ReloadTimer.time_left == 0:
		print("bang")
		$ReloadTimer.start()
		
func apply_gravity(delta: float) -> void:
	velocity.y+=gravity*delta

func _physics_process(delta: float) -> void:
	get_input()
	velocity.x = direction_x * speed * delta
	apply_gravity(delta)
	move_and_slide()

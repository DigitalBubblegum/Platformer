extends Area2D
var direction: Vector2 = Vector2.ZERO
@export var bullet_speed: int = 2000
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func setup(pos:Vector2, dir:Vector2):
	position = pos + dir * 16
	direction = dir
func _physics_process(delta: float) -> void:
	position+=direction*bullet_speed*delta

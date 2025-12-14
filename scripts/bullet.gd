extends Area2D
var direction: Vector2 = Vector2.ZERO
@export var bullet_speed: int = 400
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($Sprite2D,"scale",Vector2(0.0,0.0),0.1)
	tween.tween_property($Sprite2D,"scale",Vector2(1.0,1.0),0.1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func setup(pos:Vector2, dir:Vector2):
	position = pos + dir * 16
	direction = dir
func _physics_process(delta: float) -> void:
	position+=direction*bullet_speed*delta

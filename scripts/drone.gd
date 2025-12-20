extends CharacterBody2D
@export var droneHealth:int = 3
var player: CharacterBody2D
var directions = [Vector2i(-1,-1),Vector2i(0,-1),Vector2i(1,-1),Vector2i(1,0),Vector2i(1,1),Vector2i(0,-1),Vector2i(-1,1),Vector2i(-1,0)]
var currentDir= Vector2i(-1,-1)
@export var droneSpeed = 20
var isPlayerDetected:bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	if player and isPlayerDetected:
		var dir= (player.position - position).normalized()
		velocity = dir * droneSpeed
		move_and_slide()
	else:
		droneMovement(delta)

func droneMovement(delta:float):
	position += droneSpeed * currentDir * delta

func _on_move_random_timer_timeout() -> void:
	currentDir = directions.pick_random()

func droneDamage():
	droneHealth=-1

func droneCurrentHealth():
	return droneHealth

func setPlayerDetected():
	isPlayerDetected=!isPlayerDetected
	return isPlayerDetected

func hit():
	droneHealth-=1
	if(droneHealth<=0):
		explosionAnimation()

func explosionAnimation():
	$DroneSprite.hide()
	$ExplosionSprite.show()
	$AnimationPlayer.play("new_animation")
	await $AnimationPlayer.animation_finished
	queue_free()
	
func _on_detection_area_body_entered(playerbody: CharacterBody2D) -> void:
	player = playerbody
	setPlayerDetected()


func _on_detection_area_body_exited(_playerbody: CharacterBody2D) -> void:
	player=null
	setPlayerDetected()


func _on_collison_area_body_entered(_body: Node2D) -> void:
	droneSpeed = 0
	explosionAnimation()

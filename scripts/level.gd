extends Node2D
var bullet_scene = preload("res://scenes/bullets/bullet.tscn")
var drone_scene = preload("res://scenes/entities/drone.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_player_shoot(pos: Vector2, dir: Vector2) -> void:
	var bullet = bullet_scene.instantiate() as Area2D
	#var drone = drone_scene.instantiate() as Area2D
	$Bullets.add_child(bullet)
	bullet.setup(pos,dir)
	#if(drone.droneCurrentHealth()):
		#print(drone.droneCurrentHealth())
	#if()

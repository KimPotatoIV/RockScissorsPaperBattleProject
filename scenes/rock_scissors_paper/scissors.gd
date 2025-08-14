extends Area2D

##################################################
const SCISSORS_SCENE: PackedScene = \
preload("res://scenes/rock_scissors_paper/scissors.tscn")
const ROCK_SCENE: PackedScene = \
preload("res://scenes/rock_scissors_paper/rock.tscn")

const SCREEN_SIZE: Vector2 = Vector2(360.0, 640.0)
const MOVING_SPEED: float = 100.0

var velocity: Vector2 = Vector2(1.0, 0.0)

##################################################
func _ready() -> void:
	area_entered.connect(_on_area_entered)
	add_to_group("Scissors")
	
	_set_random_velocity()

##################################################
func _physics_process(delta: float) -> void:
	if not GameManager.get_is_starting():
		return
	
	global_position += velocity * delta
	
	if global_position.x <= 0.0 or global_position.x >= SCREEN_SIZE.x:
		global_position.x = clamp(global_position.x, 0.0, SCREEN_SIZE.x)
		velocity.x = -velocity.x
		_set_random_velocity()
	
	if global_position.y <= 0.0 or global_position.y >= SCREEN_SIZE.y:
		global_position.y = clamp(global_position.y, 0.0, SCREEN_SIZE.y)
		velocity.y = -velocity.y
		_set_random_velocity()

##################################################
func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Paper"):
		var scissors_instance = SCISSORS_SCENE.instantiate()
		scissors_instance.global_position = area.global_position
		get_parent().call_deferred("add_child", scissors_instance)
		area.queue_free()

##################################################
func _set_random_velocity() -> void:
	var random_angle_rad = deg_to_rad(randf_range(0.0, 360.0))
	velocity = velocity.rotated(random_angle_rad).normalized() * MOVING_SPEED

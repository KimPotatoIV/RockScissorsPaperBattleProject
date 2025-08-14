extends Area2D

##################################################
const PAPER_SCENE: PackedScene = \
preload("res://scenes/rock_scissors_paper/paper.tscn")
const SCISSORS_SCENE: PackedScene = \
preload("res://scenes/rock_scissors_paper/scissors.tscn")

const SCREEN_SIZE: Vector2 = Vector2(360.0, 640.0)
const MOVING_SPEED: float = 100.0
const COOLDOWN_TIME: float = 0.5

var velocity: Vector2 = Vector2(1.0, 0.0)
var timer: float = 0.0
var can_fight: bool = false

##################################################
func _ready() -> void:
	area_entered.connect(_on_area_entered)
	add_to_group("Paper")
	
	_set_random_velocity()

##################################################
func _physics_process(delta: float) -> void:
	if not GameManager.get_is_starting():
		return
	
	if not can_fight:
		timer += delta
		if timer >= COOLDOWN_TIME:
			can_fight = true
	
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
	if not can_fight:
		return
	
	can_fight = false
	timer = 0.0
	
	if area.is_in_group("Rock"):
		var paper_instance = PAPER_SCENE.instantiate()
		paper_instance.global_position = area.global_position
		get_parent().call_deferred("add_child", paper_instance)
		area.queue_free()

##################################################
func _set_random_velocity() -> void:
	var random_angle_rad = deg_to_rad(randf_range(0.0, 360.0))
	velocity = velocity.rotated(random_angle_rad).normalized() * MOVING_SPEED

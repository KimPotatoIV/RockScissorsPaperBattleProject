extends Node2D

##################################################
const ROCK_SCENE: PackedScene = \
preload("res://scenes/rock_scissors_paper/rock.tscn")
const SCISSORS_SCENE: PackedScene = \
preload("res://scenes/rock_scissors_paper/scissors.tscn")
const PAPER_SCENE: PackedScene = \
preload("res://scenes/rock_scissors_paper/paper.tscn")

const SCREEN_SIZE: Vector2 = Vector2(360.0, 640.0)


##################################################
func _ready() -> void:
	for i in range(GameManager.get_spawn_count()):
		var rock_instance = ROCK_SCENE.instantiate()
		add_child(rock_instance)
		rock_instance.global_position = \
		Vector2(randf_range(0.0, SCREEN_SIZE.x), \
		randf_range(0.0, SCREEN_SIZE.y / 3))

	for i in range(GameManager.get_spawn_count()):
		var scissors_instance = SCISSORS_SCENE.instantiate()
		add_child(scissors_instance)
		scissors_instance.global_position = \
		Vector2(randf_range(0.0, SCREEN_SIZE.x), \
		randf_range(SCREEN_SIZE.y / 3, SCREEN_SIZE.y / 3 * 2))

	for i in range(GameManager.get_spawn_count()):
		var paper_instance = PAPER_SCENE.instantiate()
		add_child(paper_instance)
		paper_instance.global_position = \
		Vector2(randf_range(0.0, SCREEN_SIZE.x), \
		randf_range(SCREEN_SIZE.y / 3 * 2, SCREEN_SIZE.y))

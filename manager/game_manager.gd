extends Node

##################################################
const START_DELAY_TIME: float = 3.0
const SPAWN_COUNT: int = 50

var timer: float = 0.0
var start: bool = false
var rock_count: int = SPAWN_COUNT
var scissors_count: int = SPAWN_COUNT
var paper_count: int = SPAWN_COUNT

##################################################
func _process(delta: float) -> void:
	timer += delta
	
	if timer >= START_DELAY_TIME:
		start = true

##################################################
func get_is_starting() -> bool:
	return start

##################################################
func get_spawn_count() -> int:
	return SPAWN_COUNT

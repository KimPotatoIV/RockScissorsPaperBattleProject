extends Node

##################################################
const START_DELAY_TIME: float = 3.0

var timer: float = 0.0
var start: bool = false

##################################################
func _process(delta: float) -> void:
	timer += delta
	
	if timer >= START_DELAY_TIME:
		start = true

##################################################
func get_is_starting() -> bool:
	return start

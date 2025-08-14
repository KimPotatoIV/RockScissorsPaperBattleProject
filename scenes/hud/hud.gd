extends CanvasLayer

##################################################
@onready var rock_count_label_nodeL: Label = \
$MarginContainer/HBoxContainer/VBoxContainerCount/RockCountLabel
@onready var scissors_count_label_nodeL: Label = \
$MarginContainer/HBoxContainer/VBoxContainerCount/ScissorsCountLabel
@onready var paper_count_label_nodeL: Label = \
$MarginContainer/HBoxContainer/VBoxContainerCount/PaperCountLabel

##################################################
func _process(delta: float) -> void:
	var rock_count = get_tree().get_nodes_in_group("Rock").size()
	var scissors_count = get_tree().get_nodes_in_group("Scissors").size()
	var paper_count = get_tree().get_nodes_in_group("Paper").size()
	var total_count = rock_count + scissors_count + paper_count
	
	rock_count_label_nodeL.text = \
	str(int((float(rock_count) / total_count) * 100)) + "%"
	scissors_count_label_nodeL.text = \
	str(int((float(scissors_count) / total_count) * 100)) + "%"
	paper_count_label_nodeL.text = \
	str(int((float(paper_count) / total_count) * 100)) + "%"

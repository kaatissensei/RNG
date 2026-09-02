extends Control

var num_outputs : int = 3
var input_min : int = 1
var input_max : int = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _get_random_numbers():
	read_inputs()
	if input_max > input_min:
		var arr_len = input_max - input_min + 1
		var numbered_arr : Array[int]
		for i in range(input_min, input_max + 1, 1):
			numbered_arr.append(i)
		if len(numbered_arr) > 0:
			numbered_arr.shuffle()
		for i in range(num_outputs):
			%Outputs.get_child(i).text = str(numbered_arr[i])
	else:
		print("Max must be greater than min")

func read_inputs():
	if %NumInput.value != 0:
		num_outputs = int(%NumInput.value)
	input_min = int(%MinInput.value)
	input_max = int(%MaxInput.value)

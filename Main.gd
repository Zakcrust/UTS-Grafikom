extends Node2D

onready var bidang_koordinat_pos = $KontainerBidang/Bidang.position

var screen_size = Vector2(1024, 576)

onready var current_mode = "Layar"

func _on_DrawArea_input_event(viewport, event, shape_idx):
	
	if current_mode == "Kartesian":
		return
	
	if Input.is_action_just_pressed("left_click"):
		var pos = -bidang_koordinat_pos + get_global_mouse_position()
		$KontainerBidang/Bidang/BidangKoordinat.set_tile(pos)
	elif Input.is_action_just_pressed("right_click"):
		var pos = -bidang_koordinat_pos + get_global_mouse_position()
		$KontainerBidang/Bidang/BidangKoordinat.remove_tile(pos)
		

func _on_Mode_pressed():
	print("pressed")
	print(current_mode)
	if current_mode == "Layar":
		$Mode.text = "Mode Kartesian"
		current_mode = "Kartesian"
		$KontainerBidang/Bidang.scale.y = -1
		$KontainerBidang/Bidang.position.y += (16 * 28)
		
	elif current_mode == "Kartesian":
		$Mode.text = "Mode Layar"
		current_mode = "Layar"
		$KontainerBidang/Bidang.scale.y = 1
		$KontainerBidang/Bidang.position.y = bidang_koordinat_pos.y

func _on_Export_pressed():
	var file = File.new()
	var data_to_export = {
		"data_koordinat" : $KontainerBidang/Bidang/BidangKoordinat.get_data_koordinat()
	}
	var json = to_json(data_to_export)
	var file_name = "user://data_koordinat.json"
	file.open(file_name,file.WRITE)
	file.store_line(json)
	file.close()
	print(data_to_export)

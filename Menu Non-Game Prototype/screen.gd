extends Control

@onready var game_button := $"Main Menu/Play Button"
@onready var main_menu_title := $"Main Menu/Title"
@onready var main_menu_subtitle := $"Main Menu/Subtitle"
var game_repaired = false

func _on_play_button_pressed():
	if game_repaired == false:
		print("button broke. pls repair.")
	if game_repaired == true:
		print("button works.")

func _on_options_pressed():
	$"Main Menu".visible = false
	$"Options Menu".visible = true

func _on_quit_pressed():
	get_tree().quit()

func _on_repair_game_pressed():
	game_repaired = true
	main_menu_title.text = "GAME WORKS"
	main_menu_subtitle.text = "Please Check The Console!"

func _on_back_pressed():
	$"Options Menu".visible = false
	$"Main Menu".visible = true


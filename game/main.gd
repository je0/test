extends Panel

var level_data = {}

func _ready():
	var level_id = get_node("/root/global").first_level_id
	load_level(get_node("/root/global").get_game_data("levels", level_id))
	
	# testing data - add some items
	get_node("base_popup_panel/inv_panel").add_item(get_node("/root/global").get_game_data("items", "mushroom"))
	get_node("base_popup_panel/inv_panel").add_item(get_node("/root/global").get_game_data("items", "mushroom"))
	get_node("base_popup_panel/inv_panel").add_item(get_node("/root/global").get_game_data("items", "mushroom"))
	get_node("base_popup_panel/inv_panel").add_item(get_node("/root/global").get_game_data("items", "mushroom"))
	get_node("base_popup_panel/inv_panel").add_item(get_node("/root/global").get_game_data("items", "herb"))
	get_node("base_popup_panel/inv_panel").add_item(get_node("/root/global").get_game_data("items", "herb"))
	get_node("base_popup_panel/inv_panel").add_item(get_node("/root/global").get_game_data("items", "stick"))
	get_node("base_popup_panel/inv_panel").add_item(get_node("/root/global").get_game_data("items", "stick"))
	get_node("base_popup_panel/inv_panel").add_item(get_node("/root/global").get_game_data("items", "stick"))
	get_node("base_popup_panel/inv_panel").add_item(get_node("/root/global").get_game_data("items", "stick"))
	get_node("base_popup_panel/inv_panel").add_item(get_node("/root/global").get_game_data("items", "dagger"))
	get_node("base_popup_panel/inv_panel").add_item(get_node("/root/global").get_game_data("items", "dagger"))
	get_node("base_popup_panel/inv_panel").add_item(get_node("/root/global").get_game_data("items", "herb"))

func _on_return_to_lobby_pressed():
	get_node("/root/global").goto_scene("res://lobby/lobby.scn")

func load_level(level_data):
	self.level_data = level_data
	get_node("location_label").set_text(level_data.title)
	print("Loading level: ", level_data.title)
	
func load_level_by_id(level_id):
	load_level(get_node("/root/global").get_game_data("levels", level_id))
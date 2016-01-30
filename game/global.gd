extends Node

const game_data_path = "res://gamedata.cdb"
const first_level_id = "vale_forest" # TODO: Where to put this constant?

var current_scene = null
var game_data = {}
var current_level_id = "vale_forest"



func goto_scene(path):

	# defer call to ensure no code is running in the current scene
	call_deferred("_deferred_goto_scene",path)


func _deferred_goto_scene(path):

	current_scene.free()

	# Load new scene
	var s = ResourceLoader.load(path)

	# Instance the new scene
	current_scene = s.instance()

	# Add it to the active scene, as child of root
	get_tree().get_root().add_child(current_scene)


func _ready():
	# Get the current scene, the first time.
	# it is always the last child of root,
	# after the autoloaded nodes.

	var root = get_tree().get_root()
	current_scene = root.get_child( root.get_child_count() -1 )
	
	# load game data
	_load_game_data(game_data_path)

func get_game_data(type, id):
	if id:
		return game_data[type][id]
	else:
		return game_data[type]

func _load_game_data(path):

	var f = File.new()
	
	if !f.file_exists(path):
		print("Error - file not found: ", path);
		return
		
	f.open(path, File.READ)
	
	# extract raw JSON data into dictionary
	var raw_data = {}
	raw_data.parse_json(f.get_as_text())
	
	# loop over "sheets", then "lines" within dict
	var i

	for i in raw_data.sheets:
		var tmp_dict = {}
		
		for a in i.lines:
			# assign rows to dict by using id as key
			tmp_dict[a.id] = a
		
		game_data[i.name] = tmp_dict
		
	f.close()

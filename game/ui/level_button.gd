extends Button

var level_id # this variable should be passed in when the instance is duplicated

func _ready():
	# Initialization here
	pass

func _input_event(ev):
	if (ev.type==InputEvent.MOUSE_BUTTON and ev.button_index==BUTTON_LEFT and ev.pressed):
		self.get_parent()._on_level_button_pressed(level_id)
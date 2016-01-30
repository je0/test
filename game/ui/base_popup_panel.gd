extends PopupPanel

func _ready():
	# Initialization here
	pass

func hide_all(hide_container):
	# Hide all panels
	for i in self.get_children():
		i.hide()
	
	if hide_container:
		self.hide()
	else:
		self.show()

func _on_show_map_toggled( pressed ):
	self.hide_all(!pressed)
	get_node("../bottom_button_panel/show_inv").set_pressed(false)
	if pressed:
		get_node("map_panel").show()

func _on_show_inv_toggled( pressed ):
	self.hide_all(!pressed)
	get_node("../bottom_button_panel/show_map").set_pressed(false)
	if pressed:
		get_node("inv_panel").show()

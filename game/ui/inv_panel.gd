extends Panel

var cols = 4
var inv_slots = []
var total_inv_slots = 20

var equip_slots = []
#var equip_slot_keys = ["chest", "head", "hands", "feet", "amulet", "ring"]

var inv_grid
var equip_grid

func _ready():
	
	# add placeholders for inventory array
	for i in range(total_inv_slots):
		inv_slots.append({ "qty": 0, "item_id": 0 })
	
	# set up inventory slots
	inv_grid = get_node("inv_grid")
	inv_grid.set_columns(cols)
	
	var slot_master = get_node("inv_grid/slot_button")
	
	for i in range(total_inv_slots-1):
		var new_slot = slot_master.duplicate()
		inv_grid.add_child(new_slot)
		
	# set up equipped slots
	equip_grid = get_node("equip_grid")
	equip_grid.set_columns(cols)
	
	slot_master = get_node("equip_grid/equip_slot_button")
	
	_set_up_equip_slot(slot_master, "weapon")
	
	equip_grid.add_child(_set_up_equip_slot(slot_master.duplicate(), "chest"))
	equip_grid.add_child(_set_up_equip_slot(slot_master.duplicate(), "head"))
	# TODO: gold goes here
	equip_grid.add_child(_set_up_equip_slot(slot_master.duplicate(), "hands"))
	equip_grid.add_child(_set_up_equip_slot(slot_master.duplicate(), "feet"))
	equip_grid.add_child(_set_up_equip_slot(slot_master.duplicate(), "amulet"))
	equip_grid.add_child(_set_up_equip_slot(slot_master.duplicate(), "ring"))
	
func _set_up_equip_slot(slot, type):
	slot.equip_type = type
	slot.get_node("equip_slot_icon").set_texture(load("res://inventory/slot-" + type + ".atex"))
	return slot
	
func add_item(item_data):
	
	print(item_data)
	
	for i in range(inv_slots.size()):
		var s = inv_slots[i]

		if s.qty == 0:
			# occupy empty slot
			s.item_id = item_data.id
			s.qty = 1
			var slot_btn = inv_grid.get_child(i)
			print(slot_btn)
			slot_btn.get_node("inv_slot_image").set_texture(load("res://inventory/" + item_data.image_id + ".atex"))
			slot_btn.text = "1"
			return true
		elif s.item_id == item_data.id and s.qty < item_data.max_per_slot:
			# stack on occupied slot with enough space
			s.qty = s.qty + 1
			var slot_btn = inv_grid.get_child(i)
			slot_btn.set_text(str(s.qty))
			return true
			
	# failed to add item
	return false
	
# auto generated

func _on_show_inv_toggled( pressed ):
	print("_on_show_inv_toggled")
	if pressed:
		show()
	else:
		hide()

# TODO:
# create array for regular items
# create map(?) for equipped slots?
# 

# equip types: chest, head, hands, feet, amulet, ring


# https://github.com/RodZill4/godot_inventory
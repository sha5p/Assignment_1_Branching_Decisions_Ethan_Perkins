extends Node
#makes const so file cant be broken somehow
const SAVE_FILE = "user://save_file.save"
var g_data = {
	0: {
		"FireRate":0,
		"Speed":0,
		"Range": 0,
	},
	1:{
		"Weapon":"Defualt",
	},
	2:{
		"Shield":0,
	},
	3: {
		"Room":0,
		"Level":0,
	},
	4: {
		"Name":"Health",
		"HP":8
	},
	5:{
		"curcits":0,
	}
}
func _ready():
	load_data()
func load_data():
	if not FileAccess.file_exists(SAVE_FILE):
		save_data()  # Save the initial g_data to the file
	else:
		# If the file exists, load the data
		var file = FileAccess.open(SAVE_FILE, FileAccess.READ)
		file.open(SAVE_FILE, FileAccess.READ)
		g_data = file.get_var()
		file.close()

func save_data():
	#writes to file based on varibles
	var file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
	file.store_var(g_data)
	file.close()


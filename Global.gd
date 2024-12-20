extends Node
signal room_entered(room)
var player: Node
var curcits = 0
var talking:bool=false
var currentRoom =0
var Level=0
var navcheck=false
var cantalk=false
var final=0

#SETS AUTOLOAD VALUES THAT RUN NO MATTER WHAT


var items = {
	1:{
		"Name":"Shield",
		"Des":"Shields protect your hearts",
		"Cost": 50,
		"Damage":1,
	},
	2:{
		"Name":"ShotGun",
		"Des":"Fast Burst Speed but it has short range",
		"Cost": 20,
		"FireRate":1.2,
		"Speed":250,
		"Range": 600,
		"Damage":3,
	},
	3:{
		"Name":"Sniper",
		"Des":"Semi Speed but has long range ",
		"Cost": 20,
		"FireRate":1.5,
		"Speed":400,
		"Range": 0,
		"Damage":4,
	},
	4:{
		"Name":"LMG",
		"Des":"Fast Burst Speed but it has short range",
		"Cost": 30,
		"FireRate":0.7,
		"Speed":300,
		"Range": 400,
		"Damage":1,
	}
}
var Health={
	0: {
		"Name":"Health",
		"Des":"Can only buy helath if not maxed",
		"Cost": 20,
		"HP":8
	}
}

var evolutions	={
	0:{
		"Name":"ShotGun",
		"Max-FireRate":"Burst Shoty",
		"Max-Range": "Bazooka"
	},
	1:{
		"Name":"Sniper",
		"Max-All":"RailGun",
	},
	2:{
		"Name":"LMG",
		"Max-FireRate":"Laser",
		"Max-Speed": "Ak-47"
	}
}
var item ={
	0:{
		"Weapon":"Defualt",
	},
	1:{
		"Shield":0,
	}
}

var upgrades={
	0: {
		"FireRate":0,
		"Speed":0,
		"Range": 0,
	}
}
var enemyFighting:bool=false
var Room={
	0: {
		"Enemy":1,
	},
	1: {
		"Enemy":2,
	},
	2:{
		"Enemy":2,
	},
	3:{
		"Enemy":0,
	},
	4:{
		"Enemy":3,
	}
}

func _ready():
	
	await get_tree().create_timer(0.3).timeout
			
	upgrades[0]["FireRate"]= SaveData.g_data[0]["FireRate"]
	upgrades[0]["Speed"]= SaveData.g_data[0]["Speed"]
	upgrades[0]["Range"]= SaveData.g_data[0]["Range"]
	item[0]["Weapon"]= SaveData.g_data[1]["Weapon"]
	item[1]["Shield"]= SaveData.g_data[2]["Shield"]
	currentRoom= SaveData.g_data[3]["Room"]
	Level= SaveData.g_data[3]["Level"]
	Health[0]["HP"]= SaveData.g_data[4]["HP"]
	curcits=SaveData.g_data[5]["curcits"]
	if item[0]["Weapon"] =="LMG":
		items[4]["FireRate"]=SaveData.g_data[6]["FireRate"]
		items[4]["Speed"]=SaveData.g_data[6]["Speed"]
		items[4]["Range"]=SaveData.g_data[6]["Range"]
	elif item[0]["Weapon"]=="ShotGun":
		items[2]["FireRate"]=SaveData.g_data[6]["FireRate"]
		items[2]["Speed"]=SaveData.g_data[6]["Speed"]
		items[2]["Range"]=SaveData.g_data[6]["Range"]
	elif item[0]["Weapon"]=="Sniper":
		items[3]["FireRate"]=SaveData.g_data[6]["FireRate"]
		items[3]["Speed"]=SaveData.g_data[6]["Speed"]
		items[3]["Range"]=SaveData.g_data[6]["Range"]


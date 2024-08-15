extends Node

var player: Node
var curcits = 500
var items = {
	1:{
		"Name":"Shield",
		"Des":"Shields protect your hearts",
		"Cost": 50,
	},
	2:{
		"Name":"ShotGun",
		"Des":"Fast Burst Speed but it has short range",
		"Cost": 20,
		"FireRate":1.2,
		"Speed":250,
		"Range": 600,
	},
	3:{
		"Name":"Sniper",
		"Des":"Semi Speed but has long range ",
		"Cost": 20,
		"FireRate":1.5,
		"Speed":400,
		"Range": 0,
	},
	4:{
		"Name":"LMG",
		"Des":"Fast Burst Speed but it has short range",
		"Cost": 30,
		"FireRate":0.7,
		"Speed":300,
		"Range": 400,
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

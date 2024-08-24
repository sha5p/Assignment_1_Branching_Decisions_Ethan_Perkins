extends CharacterBody2D
var currentItem=0
@onready var talk = $AnimatedSprite2D2
@onready var NPC = $AnimatedSprite2D
@onready var shop_anim = $Shop/ShopAnim
@onready var ItemBuying = $Shop/ShopBuy/Buy
@onready var des = $Shop/ShopBuy/Des
@onready var item = $Shop/Item
@onready var weapons = $Shop/Weapons
@onready var utlitys = $Shop/Utlitys
@onready var upgrade = $Shop/Upgrade
@onready var upgrade_ui = $Shop/Upgrade/UpgradeUi
@onready var shop_buy = $Shop/ShopBuy
@onready var back_to_main_shop = $Shop/Upgrade/UpgradeUi/BackToMainShop
@onready var evolve = $Shop/Upgrade/Evolve

@onready var evolve_ui = $Shop/Upgrade/Evolve/Evolve_Ui
@onready var speed_evolve = $Shop/Upgrade/Evolve/Evolve_Ui/VBoxContainer/Speed_evolve_button/Speed_Evolve
@onready var range_evolve = $Shop/Upgrade/Evolve/Evolve_Ui/VBoxContainer/Range_evolve_button/Range_Evolve
@onready var fire_rate_evolve = $Shop/Upgrade/Evolve/Evolve_Ui/VBoxContainer/Firerate_evolve_button/FireRate_Evolve
@onready var firerate_button_evolve = $Shop/Upgrade/Evolve/Evolve_Ui/VBoxContainer/Firerate_evolve_button
@onready var speed_button_evolve = $Shop/Upgrade/Evolve/Evolve_Ui/VBoxContainer/Speed_evolve_button
@onready var range_button_evolve = $Shop/Upgrade/Evolve/Evolve_Ui/VBoxContainer/Range_evolve_button


func _ready():
	item.text=Global.Health[currentItem]["Name"]
	des.text=Global.Health[currentItem]["Des"]+"\n Cost "+str(Global.Health[currentItem]["Cost"])+"$"
	utlitys.play(Global.Health[currentItem]["Name"])
	weapons.visible=false
	upgrade.visible=false
	Dialogic.signal_event.connect(DialogicSignal)
func _physics_process(delta):
	talk.play("NotTalking")
	NPC.play("idle")
func _on_area_2d_body_entered(body):
	if body.has_method("shop"):
		talk.play("Talking")
		NPC.play("talk")
		Global.talking=true
		Dialogic.start("Shop")
	else:
		talk.play("NotTalking")
		NPC.play("idle")
func DialogicSignal(arugment: String):
	if arugment =="End":
		shop_anim.play("ShopIn")

func _on_button_button_up():
	shop_anim.play("shopOut")
	Global.talking=false
	$Area2D.disable_mode=true
	talk.play("NotTalking")
	NPC.play("idle")
	$Timer.start()


func _on_timer_timeout():
		$Area2D.disable_mode=false
func switchItem(select):
	for i in range(5):
		if select==i and select!=0:
			currentItem=select
			weapons.play(Global.items[currentItem]["Name"])
			utlitys.visible=false
			weapons.visible=true
			item.text=Global.items[currentItem]["Name"]
			des.text=Global.items[currentItem]["Des"]+"\n Cost "+str(Global.items[currentItem]["Cost"])+"$"
			if Global.items[currentItem]["Name"]==Global.item[0]["Weapon"]:
				print("wprks")
				upgrade.visible=true
		elif select ==0:
			currentItem=select
			utlitys.play(Global.Health[currentItem]["Name"])
			weapons.visible=false
			utlitys.visible=true
			item.text=Global.Health[currentItem]["Name"]
			des.text=Global.Health[currentItem]["Des"]+"\n Cost "+str(Global.Health[currentItem]["Cost"])+"$"
			upgrade.visible=false
func _on_buy_pressed():
	$Shop/Label.text="Current Curcits "+str(Global.curcits)
	if currentItem !=0:
		if Global.item[0]["Weapon"] !=Global.items[currentItem]["Name"] and "Shield" !=Global.items[currentItem]["Name"]:
			Global.item[0]["Weapon"] =Global.items[currentItem]["Name"]
			Global.curcits-=Global.items[currentItem]["Cost"]
			Global.upgrades[0]["FireRate"]=0
			Global.upgrades[0]["Range"]=0
			Global.upgrades[0]["Speed"]=0
			if Global.items[currentItem]["Name"]==Global.item[0]["Weapon"]:
				upgrade.visible=true
	elif 0<Global.Health[0]["HP"] and Global.Health[0]["HP"]<8 and currentItem==0:
		Global.curcits -= Global.Health[0]["Cost"]
		Global.Health[0]["HP"] +=1
		upgrade.visible=false
	print(Global.curcits)
func _on_next_pressed():
	$Shop/Label.text="Current Curcits "+str(Global.curcits)
	if currentItem !=4:
		upgrade.visible=false
	switchItem(currentItem+1)
func _on_prev_pressed():
	$Shop/Label.text="Current Curcits "+str(Global.curcits)
	upgrade.visible=false
	switchItem(currentItem-1)


func _on_upgrade_pressed():
	upgrade_ui.visible=true
	shop_buy.visible=false
	$Shop/Button.visible=false
	evolve.visible=true
	evolve_ui.visible=false
	$"Shop/Upgrade/UpgradeUi/Range/Current Upgrade".text="Current Level:"+str(Global.upgrades[0]["Range"])
	$"Shop/Upgrade/UpgradeUi/Speed/Current Upgrade".text="Current Level:"+str(Global.upgrades[0]["Speed"])
	$"Shop/Upgrade/UpgradeUi/Firerate/Current Upgrade".text="Current Level:"+str(Global.upgrades[0]["FireRate"])
func _on_back_to_main_shop_pressed():
	upgrade_ui.visible=false
	shop_buy.visible=true
	evolve.visible=false
	$Shop/Button.visible=true
	evolve_ui.visible=false

func _on_evolve_pressed():
	print("Works")
	evolve_ui.visible=true
	if Global.item[0]["Weapon"]==Global.evolutions[0]["Name"]:
		range_button_evolve.visible=true
		speed_button_evolve.visible=false
		fire_rate_evolve.visible=true
		fire_rate_evolve.text=Global.evolutions[0]["Max-FireRate"]
		range_evolve.text=Global.evolutions[0]["Max-Range"]
	elif Global.item[0]["Weapon"]==Global.evolutions[1]["Name"]:
		speed_button_evolve.visible=false
		range_button_evolve.visible=false
		firerate_button_evolve.visible=true
		firerate_button_evolve.text="Max-All Upgrades"
		fire_rate_evolve.text=Global.evolutions[1]["Max-All"]
	elif Global.item[0]["Weapon"]==Global.evolutions[2]["Name"]:
		speed_button_evolve.visible=true
		range_button_evolve.visible=false
		firerate_button_evolve.visible=true
		fire_rate_evolve.text=Global.evolutions[2]["Max-FireRate"]
		speed_evolve.text=Global.evolutions[2]["Max-Speed"]


func _on_firerate_pressed():
	$Shop/Label.text="Current Curcits "+str(Global.curcits)
	print("why")
	if Global.upgrades[0]["FireRate"]  !=5 and Global.curcits>24:
		Global.curcits-=25
		Global.upgrades[0]["FireRate"] +=1
		Global.items[currentItem]["FireRate"] -=0.1
		$"Shop/Upgrade/UpgradeUi/Firerate/Current Upgrade".text="Current Level: "+str(Global.upgrades[0]["FireRate"])
func _on_speed_pressed():
	$Shop/Label.text="Current Curcits "+str(Global.curcits)
	if Global.upgrades[0]["Speed"]  !=5 and Global.curcits>24:
		Global.curcits-=25
		Global.upgrades[0]["Speed"] +=1
		Global.items[currentItem]["Speed"] +=50
		print(Global.upgrades[0])
		$"Shop/Upgrade/UpgradeUi/Speed/Current Upgrade".text="Current Level: "+str(Global.upgrades[0]["Speed"])
func _on_range_pressed():
	$Shop/Label.text="Current Curcits "+str(Global.curcits)
	if Global.upgrades[0]["Range"] !=5 and Global.curcits>24:
		Global.curcits-=25
		Global.upgrades[0]["Range"] +=1
		Global.items[currentItem]["Range"] -=50
		print(Global.upgrades[0])
		$"Shop/Upgrade/UpgradeUi/Range/Current Upgrade".text="Current Level: "+str(Global.upgrades[0]["Range"])


func _on_firerate_evolve_button_pressed():
	if Global.upgrades[0]["FireRate"]==5:
		if Global.item[0]["Weapon"]=="ShotGun":
			Global.item[0]["Weapon"]=Global.evolutions[0]["Max-FireRate"]
		if Global.item[0]["Weapon"]=="LMG":
			Global.item[0]["Weapon"]=Global.evolutions[2]["Max-FireRate"]
		if Global.item[0]["Weapon"]=="Sniper" and Global.upgrades[0]["Range"]==5 and Global.upgrades[0]["Speed"]==5:
			Global.item[0]["Weapon"]=Global.evolutions[1]["Max-All"]
func _on_speed_evolve_button_pressed():
	if Global.upgrades[0]["Speed"]==5:
		if Global.item[0]["Weapon"]=="LMG":
			Global.item[0]["Weapon"]=Global.evolutions[2]["Max-Speed"]
func _on_range_evolve_button_pressed():
	if Global.upgrades[0]["Range"]==5:
		if Global.item[0]["Weapon"]=="ShotGun":
			Global.item[0]["Weapon"]=Global.evolutions[0]["Max-Range"]


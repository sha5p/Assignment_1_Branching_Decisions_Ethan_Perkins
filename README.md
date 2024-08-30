# Assigment 1 Branching Decisions
## **Documentation Branching Decisions game Assessment 1** 

## **Research Game Comparision**  

|Compared|Fianl Fantasy XIV|Soul Knight|Stellaris|
|:-----|:----|:-----|:----|
|Branching Images|![image](https://github.com/user-attachments/assets/0e7ff2b8-ba09-4004-8291-a69e1f660ed8)(GMAJ0R, 2023)|![image](https://github.com/user-attachments/assets/b274cc58-828d-4eab-ba2d-4cc3aa0b7b07)(BSRDACCT, n.d.)|![image](https://github.com/user-attachments/assets/1ae077a0-bf7f-44f2-ad34-6da55b76a1d3)(aremonmoonserpent, n.d.)|
|Branching choices|Final Fantasy XIV is a narrative Focus game and through few but impactful choices the player is left to make via narrative decisions. Along with cutscenes to the narrative, Final Fantasy XIV sets are designed to give the player an emotional experience.|Soul Knight gives the player different branching decisions through a skill tree and a shop system (Aaron, 2024) this makes the game feel more open world to the player in which they can choose exactly how to progress through their playthrough.|Stellaris is a game heavily based on interactions with other empires from NPCs to online players. Its gameplay relying on decisions by the player from negotiating treaties, alliances, and trade deals.|
|Purposes|An RPG game orientating around a story with branching decisions to progress the player based on their choices.|A rouge-like with choices affecting how the user interacts with enemies. |A strategy game in which the user makes decisions through exploration, empire-building, negotiating treaties, alliances, and trade deals through dialogue.|



### **Conclusion**

Drawing inspiration from these games I planned to design a game based on Soul Knight for its core gameplay in which the player will go through different levels and choose to change their ability to fight the enemies. Then allowing the player if they so choose to interact with 'NPCs' in the game informing the player of certain information and giving them certain choices like Stellaris. These 'NPCs' will fit a narrative for the game as Final Fantasy XIV does for its and the player's choices when interacting with the narrative affecting the narrative of the game.

## **Planning & Design the Game**
### **Plan**
|Project|Status|Goals|
|:-------|:-------|:-------|
|Week 4|Completed|Implement Modulated code|
|Week 4|Completed|Initial Game Concept/Design| 
|Week 5|Completed|Initial Shop Branching/Enemies|  
|Week 5|Completed|Story|
|Week 5|Completed|Cut Scene| 
|Week 6|Completed|Documentation| 
### **Design**

![image](https://github.com/user-attachments/assets/f2faa143-a375-4126-88b3-e7292328f4c7)


### ***Branching choices***

### **Shop System Branching Choices**

The shop system allows the user to interact with an NPC given that with enough circuits the NPC can 'hack' into the system and can acquire powerful weapons, increase the power of their current weapons and acquire health and shields. They also may choose to upgrade their weapon to evolve it into a more powerful or less powerful weapon depending on how much they have upgraded their current one. This evolution is not shown to the player so the player will have to branch out and go back to get the best weapon preference.

#### **Flow Chart**
![image](https://github.com/user-attachments/assets/827d2e58-e4a6-48b3-968f-5f854553e919)
	
|Buying Weapon UI|Evolving and Upgrading UI|
|:---------|:---------|
|![image](https://github.com/user-attachments/assets/c0ef7202-862a-4738-8944-a604aef2f225)|![image](https://github.com/user-attachments/assets/bcf47cbf-2910-4e56-8c35-b9f5d7622181)|

#### **Code buying item**
 ```
func _on_buy_pressed(): #When pressed checks if the weapon is the current weapon or if shield and health max if is not buy else dont
	if currentItem !=0:
		if Global.item[0]["Weapon"] !=Global.items[currentItem]["Name"] and "Shield" !=Global.items[currentItem]["Name"]:
			Global.item[0]["Weapon"] =Global.items[currentItem]["Name"]
			Global.curcits-=Global.items[currentItem]["Cost"]
			Global.upgrades[0]["FireRate"]=0
			Global.upgrades[0]["Range"]=0
			Global.upgrades[0]["Speed"]=0
			if Global.items[currentItem]["Name"]==Global.item[0]["Weapon"]:
				upgrade.visible=true
		elif  "Shield" ==Global.items[currentItem]["Name"] and Global.item[1]["Shield"]!=3:
			Global.curcits-=50
			Global.item[1]["Shield"]+=1
	elif 0<Global.Health[0]["HP"] and Global.Health[0]["HP"]<8 and currentItem==0:
		Global.curcits -= Global.Health[0]["Cost"]
		Global.Health[0]["HP"] +=1
		upgrade.visible=false
```
#### **Analysis**

##### Buying items 

This code checks if the item is not bought and maxed and if it is the NPC won't take any circuits. If it isn't bought or maxed it takes the dictionary value of the price and then deducts that many circuits from the player's current amount if there are not enough circuits nothing will happen as well. The reason that the health is in a different dictionary is due to the animation sizes for the sprites. Preferably these different items would be in the same dictionary or instead a list which then would loop through to deduct prices. Alternatively, the shop system could have run through signals that would add items to a list and when the signal is activated other items in the list could have been altered but this was not done due to time constraints. 

#### **Code Upgrading and Evolving Example**
```
func _on_range_pressed(): #evolves if requirment met (maxed) to desired weapon
	$Shop/Label.text="Current Curcits "+str(Global.curcits)
	if Global.upgrades[0]["Range"] !=5 and Global.curcits>24:
		Global.curcits-=25
		Global.upgrades[0]["Range"] +=1
		Global.items[currentItem]["Range"] -=50
		print(Global.upgrades[0])
		$"Shop/Upgrade/UpgradeUi/Range/Current Upgrade".text="Current Level: "+str(Global.upgrades[0]["Range"])

func _on_range_evolve_button_pressed(): #evolves if requirment met (maxed) to desired weapon
	if Global.upgrades[0]["Range"]==5:
		if Global.item[0]["Weapon"]=="ShotGun":
      			Global.item[0]["Weapon"]=Global.evolutions[0]["Max-Range"]
```
#### **Analysis**

##### Upgrading and Evolving the weapon

Running through a prebuilt system'On Button Pressed' will only be functional on the current weapon. Taking the current dictionary values then changing the values for the upgrade and its current level and deducting circuits. The reason that not all these upgrades were in the same script was for useability for the player. Evolutions run similarly but instead, check the upgrade level and if applicable then evolve the weapon. This could have been implemented instead by using a variety of variables and changing the current weapon to the variable though this improves readability it would require many more lines of code for the same effect. These evolutions and powerups branch throughout the different upgrades and give different weapons letting the player fight against the mobs in different ways from closer to further to more risky. 

#### **Code switching through shop items**

```
func switchItem(select):   #setting the text and animation for the shop item via for loops and elifs
	for i in range(5):
		if select==i and select!=0:
			currentItem=select
			weapons.play(Global.items[currentItem]["Name"])
			utlitys.visible=false
			weapons.visible=true
			item.text=Global.items[currentItem]["Name"]
			des.text=Global.items[currentItem]["Des"]+"\n Cost "+"$"+str(Global.items[currentItem]["Cost"])
			if Global.items[currentItem]["Name"]==Global.item[0]["Weapon"]:
				print("works")
				upgrade.visible=true
		elif select ==0:
			currentItem=select
			utlitys.play(Global.Health[currentItem]["Name"])
			weapons.visible=false
			utlitys.visible=true
			item.text=Global.Health[currentItem]["Name"]
			des.text=Global.Health[currentItem]["Des"]+"\n Cost "+"$"+str(Global.Health[currentItem]["Cost"])
			upgrade.visible=false
```
#### **Analysis**

##### Switching through shop items

To change through the different branching decisions this function is called when clicking the two side buttons 
![image](https://github.com/user-attachments/assets/257f6670-6d41-4968-b83b-8524545f4380)
then selecting is set to the current item. The system's distinctive side buttons the game telling the user 'These are your options' making the branching 'choices' that they can make clear. The code takes the 'select' or the number for which item and then goes through a global dictionary. This dictionary looks for a key 'number' to set the description of the item its name and the animation of the item. Without this navigation being clear the player may struggle to find where they can make choices to impact their game options


### **Story Branching Choices**

#### **Dialogue Photos**
|Dialogue logic|
|:---------|
|![image](https://github.com/user-attachments/assets/c078f1d2-a62d-4fc4-b9aa-2da6b53eff78)|
|Scence display|
|![image](https://github.com/user-attachments/assets/6cf2962b-bb4a-42a0-83bb-f36c3a3611b9)![image](https://github.com/user-attachments/assets/96be63ce-3fa0-481e-b581-8f653b73939d)![image](https://github.com/user-attachments/assets/7820852d-3b40-4aba-bb71-7f22da0f07c4)|
#### **Flow Chart**
![image](https://github.com/user-attachments/assets/9ff801a1-d4c7-4ea4-b1c4-73209258ee93)

#### **Code/Dialogue** 

```
extends Node2D
@onready var collision_shape_2d = $Area2D/CollisionShape2D
@onready var label = $Label
@onready var animation_player = $AnimationPlayer
#if colliding if the npc and the talk button is pressed start the dialogue 
func _ready():
	animation_player.play("Defualt")
	Dialogic.signal_event.connect(DialogicSignal)
	
func DialogicSignal(arugment: String): #Connects signals to dialogic 
	print("Received argument:", arugment)
	if arugment =="End":
		print("Global.talking=false")
		Global.talking=false
		collision_shape_2d.disabled=true
		await get_tree().create_timer(1).timeout
		collision_shape_2d.disabled=false
		queue_free()
	if arugment =="Good":
		SaveData.end=true
		SaveData.ending()
	if arugment =="Bad":
		SaveData.end=false
		SaveData.ending()
func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("Talk"):
		print("debug")
		print(Global.cantalk)
	if event.is_action_pressed("Talk") and Global.cantalk:
		Dialogic.start("warning")
		Global.talking=true

func _on_area_2d_body_entered(body):
	var talk = SaveSettings.config.get_value("keybinding", "Talk")
	label.visible=true
	label.text= "Cick: %s to talk" % [talk]
	Global.cantalk=true
	

func _on_area_2d_body_exited(body):
	label.visible=false
	Global.cantalk=false
```

#### **Analysis**

By using an import known as dialogic instead of creating my own dialogue system it made the interactions and sending signals much more powerful. Instead of using a dialogic-based system, modulated code could have been used alternatively which reads through Text files and prints dialogue. However, this code would be much jankier when sending signals as many if and else statements would have to be run when reading files to look for keywords. This is why a dialogic timeline was used taking in different choices to alter the timeline based on what the user inputs from 'Your lying' to 'A fake?'. These different branching choices then emit different signals received in the scripts. The script connects to dialogic and changes the values of certain signals which will allow different dialogues to play later on. These changes in values could have been done via save states but were avoided due to bugs inside dialogics functions like the one below. 

|Dialogic Problem|Solution|
|:---|:----|
|The Dialogue would constantly break after the first timeline was played|The issue did not stem from a code error nor a signal sending error but an inbuilt function in dialogic known as the wait for 'time' which would then cause dialogue to wait indefinitely|

#### **Dialogic to game cutscence**
```
func _ready():
	#makes sure you can only talk when all enemys killed and resets values via 
	Global.final=0
	Global.enemyFighting =true
	Dialogic.signal_event.connect(DialogicSignal)
	animation_player.play("Cut Scence")
	Dialogic.start("Final")
	Global.talking=true
```

First the connecting save values to dialogic via the script so that the different cutscenes are playable depending on the choices made beforehand. Then once the cutscene has finished and the player interacts with the general kabob where the comparison with the connected variables and signals is made. 

```		
func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("Talk") and Global.cantalk and Global.final==3:
		print(SaveData.end)
		Global.talking=true
		if SaveData.end==true:
			Dialogic.start("kobob_saved_good")
		if SaveData.end==false:
			Dialogic.start("kobob_saved_bad")
```

Then the ending of the game uses signals from dialogic again which will emit different signals depending on which cutscene was player 'kobob_saved_good' or 'kobob_saved_
bad'. 

```
func DialogicSignal(arugment: String):
	if arugment =="Camera":
		camera.play("Camera")
	if arugment =="End":
		var spawner=get_tree().get_nodes_in_group("Spawner")
		_66x_66x_30.visible=false
		_66x_66x_31.visible=false
		_66x_66x_32.visible=false
		for i in spawner:
			print(i)
			i.spawn()
		Global.talking=false
		camera_2d.enabled=false
	if arugment =="Bad Ending":
		get_tree().change_scene_to_file("res://Scences/Levels/bad_ending.tscn")
	if arugment =="Boom":
		camera_2d.enabled=true
		kobob.visible=false
		boom.visible=true
		boom.play("default")
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://Scences/Levels/good_ending.tscn")
```
Alternatively, the two different dialogues could have been run under the same timeline and then run through the built-in if, else checker in dialogic. However, this was not done as two distinctive timelines depending on the ending results are cleaner if others were to read through rather than having a long dialogic script. 

### **Interactions and Level Design**

|Images|
|:---------|
|![image](https://github.com/user-attachments/assets/9c90ba6a-a3cc-41e8-9279-a729504ccad2)![image](https://github.com/user-attachments/assets/ebc3f014-33d7-4d72-ba98-9ff152433822)|

#### **Analysis**

This branching game is designed to make the next destination for the player very apparent with labels for different parts of the levels for navigation and an NPC interaction to explain the game. ![image](https://github.com/user-attachments/assets/5acbc641-269c-4426-95e1-efaa13824d87)![image](https://github.com/user-attachments/assets/020848df-6beb-425b-ad09-5c7a52ab278f)

These navigation choices let the player easily understand the type of branching choices that they can make while progressing through the levels. While each level is indicated via the same sprites for doors and teleporters allowing for the navigation to be further enhanced with the addition of the instructions. This navigation was done due to feedback given on the game and after altering these mechanics it is apparent to the players that navigation was improved. 

![image](https://github.com/user-attachments/assets/d6c09872-ab67-4a85-901c-72c02f0ad42e)

## **Testing / Evaluation of Your Game**

Having branching decisions from the storyline to the dialogue that the player can make affects how the user interacts at each level and how they finish the game. I have made a few dialogue choices but they are important affecting the narrative ending as a whole and a Shop system for the player to interact with the levels differently depending on their item choices. When running a shop system in later games as lots of the code is modelable it will allow me to easily add it much like my save states added from the last assignment. 

The branching is apparent and taking feedback from the user to 
![image](https://github.com/user-attachments/assets/e93f2f76-338b-441d-9bc7-b0ad36e3533a)

If I were to do this assignment again I would make the game incorporate more modulated script through my weapon system much like the shop system making a thorough list of dialogic functions that work and don't work so my decisions and process would happen plainly in dialogic. In conclusion, this game runs through multiple different branching choices from the game's story to how the player interacts with the levels.  




## **Biblogrpathy**

Aaron. (2024). *Season Shop.* [online] Soul Knight Wiki. Available at: https://soul-knight.fandom.com/wiki/Season_Shop [Accessed 22 Aug. 2024].

aremonmoonserpent (n.d.). *The planets shop has opened.* [online] Reddit. Available at: https://www.reddit.com/r/Stellaris/comments/15yfokf/the_planets_shop_has_opened/ [Accessed 23 Aug. 2024].

BSRDACCT (n.d.). *Heretic Build Discussion.* [online] Reddit.* Available at: https://www.reddit.com/r/SoulKnightPrequel/comments/18ajbzw/heretic_build_discussion/ [Accessed 23 Aug. 2024].

DziiTen (n.d.). mystery music loop. [online] Pixabay. Available at: https://pixabay.com/sound-effects/mystery-music-loop-226835/ [Accessed 29 Aug. 2024].

‌Eduard_M (2024). Seamless loop of interstellar travel through a blue and red wormhole filled with stars. Space journey through time continuum. Warp in science fiction black hole vortex hyperspace tunnel. [online] Storyblocks.com. Available at: https://www.storyblocks.com/video/stock/seamless-loop-of-interstellar-travel-through-a-blue-and-red-wormhole-filled-with-stars-space-journey-through-time-continuum-warp-in-science-fiction-black-hole-vortex-hyperspace-tunnel-b0gi4eorfjh7j1ovx?preview=1 [Accessed 28 Aug. 2024].

itch.io. (n.d.). Tech Dungeon: Roguelite - Asset Pack by Pupkin. [online] Available at: https://trevor-pupkin.itch.io/tech-dungeon-roguelite.

‌itch.io. (2024). Heart beta. [online] Available at: https://cup-coffee.itch.io/pixel-hearts [Accessed 12 Aug. 2024].

‌itch.io. (2024). The Ultimate Weapons Pack. [online] Available at: https://jestan.itch.io/weapons-pack [Accessed 10 Aug. 2024].

‌itch.io. (2024). GUNS + RELOADS. [online] Available at: https://c1aymor3.itch.io/guns-reloads [Accessed 20 Aug. 2024].

itch.io. (n.d.). Free Space Shooter Game User Interface by Free Game Assets (GUI, Sprite, Tilesets). [online] Available at: https://free-game-assets.itch.io/free-space-shooter-game-user-interface.

‌itch.io. (2024). Teleport-in animation. [online] Available at: https://bybibo.itch.io/teleport-in-animation [Accessed 28 Aug. 2024].

GMAJ0R (2023). *A glimpse of the mid game skill tree.* [online] Reddit. Available at: https://www.reddit.com/r/FFXVI/comments/1229p9y/potential_spoilers_yoship_accidentally_showed_a/ [Accessed 23 Aug. 2024].

McCrunchy (n.d.). Muffled Party Music. [online] Pixabay. Available at: https://pixabay.com/sound-effects/muffled-party-music-183774/ [Accessed 29 Aug. 2024].

n.a (n.d.). [online] Craiyon . Available at: https://www.craiyon.com/image/PGFOY9CuSEqB9BtdbWbTMQ [Accessed 29 Aug. 2024].

Promptbase.com. (2024). Sci-fi RPG Character Portraits Midjourney Prompt | PromptBase. [online] Available at: https://promptbase.com/prompt/digital-dinosaur-portraits [Accessed 20 Aug. 2024].

Pixabay (n.d.). shoot 1. [online] Available at: https://pixabay.com/sound-effects/shoot-1-81135/ [Accessed 29 Aug. 2024].

‌Pixabay (n.d.). Game Over. [online] Pixabay. Available at: https://pixabay.com/sound-effects/game-over-38511/ [Accessed 29 Aug. 2024].

‌Pixabay (n.d.). Chill Drum Loop. [online] Pixabay. Available at: https://pixabay.com/sound-effects/chill-drum-loop-6887/ [Accessed 29 Aug. 2024].
‌
‌soreCactus (2017). Justin Nichol’s sci-fi portraits- png, psd, transparency. [online] OpenGameArt.org. Available at: https://opengameart.org/content/justin-nichols-sci-fi-portraits-png-psd-transparency.[Accessed 19 Aug. 2024].

www.merriam-webster.com. (n.d.). *Definition of SANDBOX.* [online] Available at: https://www.merriam-webster.com/dictionary/sandbox#:~:text=%3A%20a%20video%20game%20or%20part.(www.merriam-webster.com, n.d.)[Accessed 9 Aug. 2024].

‌https://www.vecteezy.com/video/7079117-4k-60-fps-looping-space-travel-with-hyper-speed-a-beam-of-stars-in-the-universe-while-moving-at-the-speed-of-light-abstract-creative-cosmic-background-hyper-jump-into-another-galaxy-3d-rendering[Accessed 20 Aug. 2024].
‌


‌

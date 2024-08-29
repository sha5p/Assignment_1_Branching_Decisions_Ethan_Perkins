# Assigment_3_Branching_Decisions
## **Documentation Branching Decisions game Assessment 1** 

## **Planning**
|Project|Status|Goals|
|:-------|:-------|:-------|
|Week 4|Completed|Implement Modulated code|
|Week 4|Completed|Inital Game Concept/Design| 
|Week 5|Completed|Inital Shop Branching/Enemys|  
|Week 5|Completed|Story|
|Week 5|Completed|Cut Scence| 
|Week 6|not done|Documentation| 
### **Research Game Comparision**  



|Compared|Fianl Fantasy XVI|Soul Knight|Stellaris|
|:-----|:----|:-----|:----|
|Branching Images|![image](https://github.com/user-attachments/assets/0e7ff2b8-ba09-4004-8291-a69e1f660ed8)(GMAJ0R, 2023)|![image](https://github.com/user-attachments/assets/b274cc58-828d-4eab-ba2d-4cc3aa0b7b07)(BSRDACCT, n.d.)|![image](https://github.com/user-attachments/assets/1ae077a0-bf7f-44f2-ad34-6da55b76a1d3)(aremonmoonserpent, n.d.)|
|Branching choices|Final Fantasy XVI is a narrative Focus game and through few but impactful choices the player is left to choose narritive choices. Along with cutscences to the narritive Final Fantasy XVI sets is designed to give the player an emotional experience.|Soul Knight gives the player diffrent branching decisions through a skill tree and a shop system (Aaron, 2024) this makes the game feel more open world to the player in which they can choose exactly how to progress through their playthrough|Stellaris is a game heavily based on interactions with other emperies from npcs to online players. Its gameplay based on decisions like negotiate treaties, alliances, and trade deals which set the player |
|Purposes|An RPG game orientating around a story with branching decisions to progress the player based on their choices|A rouge like with choices effecting how the user intreacts with enemys|A stratgey game in which the user makes decisions through  exploration, empire-building, negotiate treaties, alliances, and trade deals through dialogue .|



### **Conclusion**
Drawing inspiration from these games I planned to design a game based on Soul Knight for its core game play in which the player will go through diffrent levels and choose to change their ablity to fight the enemys. Then allowing the player if they so choose to interact with 'npcs' in the game informing the player of certain information and giving them certain choices like Stellaris. These 'npcs' will fit a narritive for the game as Final Fantasy XVI does for its and the players choices when interacing with the narritive effecting the narritive of the game.

## **Planning & Design the Game**

## ***Branching choices***

## **Shop System Branching Choices**

The shop system allows the user to interact with an NPC giving that with enough circuita the NPC can 'hack' into the systen and can acquire powerful weapons, increase their current weapons power and aquire health and shields. They also may choose to upgrade their weapon to evolve it into a more powerful or less powerful weapon depending on how much they have upgraded their current one. This evolution not shown to the player so that the player will have to branch out and go back to get the best weapon prefrence. 

### **Flow Chart**
![image](https://github.com/user-attachments/assets/827d2e58-e4a6-48b3-968f-5f854553e919)

|Buying Weapon UI|Evolving and Upgrading UI|
|:---------|:---------|
|![image](https://github.com/user-attachments/assets/c0ef7202-862a-4738-8944-a604aef2f225)|![image](https://github.com/user-attachments/assets/bcf47cbf-2910-4e56-8c35-b9f5d7622181)|

### **Code buying item**
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
### **Analysis**

#### Buying items 

This code checks if the item is not bought and maxed and if it is the NPC wont take any curcits. If it isnt bought or maxed it takes the dictonary value of the price and then deducts that many circuits from the players current amount if there is not eenough curcits nothing will happen as well. The reason that the health is in a diffrent dictonary is due to animation sizes for the sprites. Prefrabley these diffrent items would be in the same dictonary or instead a list which then would loop through to deduct prices. Alternativly the shop system could have run through signals that would add items to a list and when the signal is activated other items in the list could have been altered but this was not done due to time constraints. 


**Code Upgrading and Evolving Example**
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
### **Analysis**

#### Upgrading and Evolving the weapon

Running through a prebuilt system  'On Button Pressed' will only be functional on the current weapon. Taking the current dictonary values then changing the the values for the upgrade and its current level as well as deducting circuits. The reason that not all these upgrades were in the same script was for useriblty for the player. Evolutions running  simlilar but instead checks the upgrade level and if applicable then evolves the weapon. This could have been implmented instead by using a varity of varibles and changing the current weapon to the varible though this improves readiblity it would require much more lines of code for the same effect. These evolutions and powerups branch throughout the diffrent upgrades and give diffrent weapons letting the player fight against the mobs in diffrent ways from closer to further to more risky. 

**Story Branching Choices**

**Dialogue Photos**
 
 |Dialogue logic|Scence display|
 |:---------|:---------|
 |![image](https://github.com/user-attachments/assets/c078f1d2-a62d-4fc4-b9aa-2da6b53eff78)|![image](https://github.com/user-attachments/assets/6cf2962b-bb4a-42a0-83bb-f36c3a3611b9)
 ![image](https://github.com/user-attachments/assets/96be63ce-3fa0-481e-b581-8f653b73939d)![image](https://github.com/user-attachments/assets/7820852d-3b40-4aba-bb71-7f22da0f07c4)|
**Code/Dialogue** 
```extends Node2D
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

**Analysis**
By using an import known as dialogic instead of creating my own dialogue system it made the interactions and sending signals much more powerful. As shown above dialogic signals and functions can connect to diffrent parts of the script this means making branching choices like the above and giving choices is much more modulated. The NPC **idk yet** gives the user going through the ship a request the request is optional and makes it a branching narritive that can occur. If the player choose to help this NPC using the signals and branching via dialogic a choice is given. Showing what is happening specfically in the import is **:O**. Analysis instead of doing this via if staments and my own dialogue system presenting it like this not only makes the interaction less junky but more powerful and costumisable like **dadad** for the player. 

**Interactions and Level Design**

**Images**
![image](https://github.com/user-attachments/assets/9c90ba6a-a3cc-41e8-9279-a729504ccad2)
![image](https://github.com/user-attachments/assets/ebc3f014-33d7-4d72-ba98-9ff152433822)


**Analysis**

These levels are designed as shown above to give the player destictive decisiosns that can be made as the 'options' to choose from. The telporter activating when the user completes a certain task on a level like the tutoril kill the first mob. NPC are obvious fromt their question mark and destictive chracteristics. 

Features purpose

DEBUGGIN PROBLEM AND SOLUTION


## **Testing / Evaluation of Your Game**

Throught the process of making this game I have made many changes important onces such as ... and..... With branching decisions impacting the story that unfolds to how the player interacts with oppenets and friendly npcs on the map. Understanding how powerful dialogic can be with its signals being sent as well as how it can call other ques is what led to this outcome understanding these branching will allow me to implemnt this in other serniors such as navigating a website through 'choices' or **example** thanks to **exmaple** i did **idea**. 

If i were to do this again I would try running through more moldulatable script such **example** addtionally still using dialogic but trying to use more feature like its **exmaple** which allows for **idk**. Summary stuff done

**Biblogrpathy**

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

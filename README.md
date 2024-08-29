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
||![image](https://github.com/user-attachments/assets/0e7ff2b8-ba09-4004-8291-a69e1f660ed8)(GMAJ0R, 2023)|![image](https://github.com/user-attachments/assets/b274cc58-828d-4eab-ba2d-4cc3aa0b7b07)(BSRDACCT, n.d.)|![image](https://github.com/user-attachments/assets/1ae077a0-bf7f-44f2-ad34-6da55b76a1d3)(aremonmoonserpent, n.d.)|
|Branching choices|Has 'Branching' affecting how the user interacts with the game using a skill tree and shop and a shop|Its branching is the main 'choice' that the user must make not following a story line with a dungon system|Stellaris is like giant chess where everything from forming relsonships choosing your chracter and your fleet is a bracnhing choice branching choices is the game|
|Type of game|An RPG game orientating around a story with branching dicsions to progress|A rouge like with choices effecting how the user intreacts with enemys|a relasonship and stratgey game in which the user makes decisions that is the game all about choices(Aaron, 2024)|

#### **Conclusion**
Taking all these diffrent games into account I will design my game to that give the user a varity of diffrent ways to interact and make 'choices' in the game. From diffrent **Endings** to the game to how the player will interact with the diffrent levels. This leaded me into having a shop system and a branching dialogue.

## **Planning & Design the Game**

### ***Branching choices***

For branching choicies I will add two main choices one branching decisions in the story and the other the shop system. 

**Shop System Branching Choices**

The shop system allows the user to interact with an NPC giving them an experience of trying to figure out **MUCH LIKE STLOROS** if they should spend money on a more powerful weapon increase there health and buy and Expensive shield as they ahve already acquired a weapon and have max health. They also may choose to upgrade their weapon to evolve it into somthing more powerful. However not showing what a weapon can evolve into also makes the user hesitant to upgrade and evolve and may instead use there money to buy a new weapon restarting their progreess in hopes to find a more powerful upgrade. 

### **Flow Chart**
![image](https://github.com/user-attachments/assets/827d2e58-e4a6-48b3-968f-5f854553e919)

### **Pictures**
|Buying Weapon UI|Evolving and Upgrading UI|
|:---------|:---------|
|![image](https://github.com/user-attachments/assets/c0ef7202-862a-4738-8944-a604aef2f225)|![image](https://github.com/user-attachments/assets/bcf47cbf-2910-4e56-8c35-b9f5d7622181)|

### **Code buying item**
 ```
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
```

**Code Upgrading and Evolving Example  ---FIX THE PRICE**
```
func _on_range_pressed():
	$Shop/Label.text="Current Curcits "+str(Global.curcits)
	if Global.upgrades[0]["Range"] !=5 and Global.curcits>24:
		Global.curcits-=25
		Global.upgrades[0]["Range"] +=1
		Global.items[currentItem]["Range"] -=50
		print(Global.upgrades[0])
		$"Shop/Upgrade/UpgradeUi/Range/Current Upgrade".text="Current Level: "+str(Global.upgrades[0]["Range"])

func _on_range_evolve_button_pressed():
	if Global.upgrades[0]["Range"]==5:
		if Global.item[0]["Weapon"]=="ShotGun":
      			Global.item[0]["Weapon"]=Global.evolutions[0]["Max-Range"]
```
### **Analysis**

#### Buying the weapon 

**note maybe quote**

This code first checks if the item is not health as its functions are run in another dictonary this was done for enemy scripts but could have been put into the same dictonary. Then it checks wheather the weapon is the current weapon or if it the shield upgrade, if it is the current weapon it wont take any curcits and re buy the weapon and the shield will be bought in the below stament. It then takes away the weapons cost and resets the upgradings punishing the player but giving them a chance to go back. This code could have also be done through a for loop but this was not done as it does not save enough lines to be worth sacrficing readiblity. 

#### Upgrading and Evolving the weapon

Running through a prebuilt system this 'On Button Pressed' much like the buy button allows the signal only to run on the wapon upgraded. it then changes the current range adding more to how far the bullet can go then adding and upgrade level and taking away the currency. The reason that not all these upgrades were in the same script is that each upgrade button is diffrent and for player usiblity clicking the same button for each evolution or a drop down would making it harder for the player to navigate the shop and so intead more lines were added. For evolutions this was very similar however implmenting it was much eaiser it simply checks the global upgrade is maxxed and if it is and the button is clicked it goes to the dictonary and changes the weapon. 

**Story Branching Choices**

**Flow Chart**

**Code/Dialogue** 

**Analysis**
By using an import known as dialogic instead of creating my own dialogue system it made the interactions and sending signals much more powerful. As shown above dialogic signals and functions can connect to diffrent parts of the script this means making branching choices like the above and giving choices is much more modulated. The NPC **idk yet** gives the user going through the ship a request the request is optional and makes it a branching narritive that can occur. If the player choose to help this NPC using the signals and branching via dialogic a choice is given. Showing what is happening specfically in the import is **:O**. Analysis instead of doing this via if staments and my own dialogue system presenting it like this not only makes the interaction less junky but more powerful and costumisable like **dadad** for the player. 

**Interactions and Level Design**

**Imiages**-fix spelling oml
![image](https://github.com/user-attachments/assets/9c90ba6a-a3cc-41e8-9279-a729504ccad2)
![image](https://github.com/user-attachments/assets/ebc3f014-33d7-4d72-ba98-9ff152433822)


**Analysis**

These levels are designed as shown above to give the player destictive decisiosns that can be made as the 'options' to choose from. The telporter activating when the user completes a certain task on a level like the tutoril kill the first mob. NPC are obvious fromt their question mark and destictive chracteristics. 

Features purpose

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

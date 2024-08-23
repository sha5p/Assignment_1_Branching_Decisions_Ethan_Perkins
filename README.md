# Assigment_3_Branching_Decisions
## **Documentation Branching Decisions game Assessment 1** 

### **Planning**
|Project|Status|Goals|
|:-------|:-------|:-------|
|Week 4|Completed|Implement Modulated code|
|Week 4|Completed|Inital Game Concept/Design| 
|Week 5|Completed|Inital Shop Branching/Enemys|  
|Week 5|Progress|Story|
|Week 5|Progress|Cut Scence| 

### **Research Game Comparision**  

-note add refrences

For this game Research I will be comparing three diffrent types of branching decisions from Fianl Fantasy XVI, Soul Knight and Stellaris. Final Fantasy games popular for their story lines and how they can be progressed in many ways with branching decisions through dialogue effecting how chracters interact with the player and as a result effecting the ending. Addtional Final Fantasy XVI uses a branching upgrade system commenly refered to as a 'skill tree' that allows for the user to choose how they interact with the enemys with 'power ups'. Soul Knight a top down rouge like is less story line driven and leaves more up to the players choices giving them a shop system as well as a skill tree to use while navigating throughout the levels (Aaron, 2024). Stellaris is a real-time strategy game in which unlike the other games everything is up to the player every decision they make will affect the game from the race they choose to how they manage their resoures, relationships and their current 'fleet' like the pieces they have in chess. To compare these games the following table was made

|Compared|Fianl Fantasy XVI|Soul Knight|Stellaris|
|:-----|:----|:-----|:----|
||![image](https://github.com/user-attachments/assets/0e7ff2b8-ba09-4004-8291-a69e1f660ed8)(GMAJ0R, 2023)|![image](https://github.com/user-attachments/assets/b274cc58-828d-4eab-ba2d-4cc3aa0b7b07)(BSRDACCT, n.d.)|![image](https://github.com/user-attachments/assets/1ae077a0-bf7f-44f2-ad34-6da55b76a1d3)(aremonmoonserpent, n.d.)|
|Branching choices|Has 'Branching' affecting how the user interacts with the game using a skill tree and shop and a shop|Its branching is the main 'choice' that the user must make not following a story line with a dungon system|Stellaris is like giant chess where everything from forming relsonships choosing your chracter and your fleet is a bracnhing choice branching choices is the game|
|Type of game|An RPG game orientating around a story with branching dicsions to progress|A rouge like with choices effecting how the user intreacts with enemys|a relasonship and stratgey game in which the user makes decisions that is the game all about choices|

#### **Conclusion**
Taking all these diffrent games into account I want to design my game to take some features from all of them to give the user a varity of diffrent ways to interact and make 'choices' in the game. I want to take the idea from Fianl Fantasy XVI that choices with other chracters result in diffrent **Endings** to the game. From Soul Knight I will take its shop system to let the user choose how they want to play the game while going through these choices. Addtionally the choices not only impacting the outcome of the game but how they get to the outcome much like the relsonships in Stellaris.

### **Planning & Design the Game**

### ***Branching choices***
For branching choicies I will add two main choices one branching decisions in the story and the other the shop system. 

Shop System Branching Choices
This shop system allows the user to interact with an NPC giving them an experience of trying to figure out **MUCH LIKE STLOROS** if they should spend money on a more powerful weapon increase there health and buy and Expensive shield as they ahve already acquired a weapon and have max health. They also may choose to upgrade their weapon to evolve it into somthing more powerful. However not showing what a weapon can evolve into also makes the user hesitant to upgrade and evolve and may instead use there money to buy a new weapon restarting their progreess in hopes to find a more powerful upgrade. 

### **Flow Chart**
![image](https://github.com/user-attachments/assets/c03d224b-a228-4f0c-a570-f5528e770ac2)

### **Pictures**
|Buying Weapon UI|Evolving and Upgrading UI|
|:---------|:---------|
|![image](https://github.com/user-attachments/assets/c0ef7202-862a-4738-8944-a604aef2f225)||![image](https://github.com/user-attachments/assets/bcf47cbf-2910-4e56-8c35-b9f5d7622181)|

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

**Code Upgrading and Evolving Example**
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
**Analysis**

Story Branching Choices

Flow Chart

Code/Dialogue 

Analysis 


**Biblogrpathy**

Aaron. (2024). *Season Shop.* [online] Soul Knight Wiki. Available at: https://soul-knight.fandom.com/wiki/Season_Shop [Accessed 22 Aug. 2024].

aremonmoonserpent (n.d.). *The planets shop has opened.* [online] Reddit. Available at: https://www.reddit.com/r/Stellaris/comments/15yfokf/the_planets_shop_has_opened/ [Accessed 23 Aug. 2024].

BSRDACCT (n.d.). *Heretic Build Discussion. [online] Reddit.* Available at: https://www.reddit.com/r/SoulKnightPrequel/comments/18ajbzw/heretic_build_discussion/ [Accessed 23 Aug. 2024].

GMAJ0R (2023). *A glimpse of the mid game skill tree.* [online] Reddit. Available at: https://www.reddit.com/r/FFXVI/comments/1229p9y/potential_spoilers_yoship_accidentally_showed_a/ [Accessed 23 Aug. 2024].

www.merriam-webster.com. (n.d.). Definition of SANDBOX. [online] Available at: https://www.merriam-webster.com/dictionary/sandbox#:~:text=%3A%20a%20video%20game%20or%20part.(www.merriam-webster.com, n.d.)

‌

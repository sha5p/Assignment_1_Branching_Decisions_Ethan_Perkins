# Assigment_3_Branching_Decisions
## **Documentation Branching Decisions game Assessment 1** 

## **Planning**
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

## **Planning & Design the Game**

### ***Branching choices***

For branching choicies I will add two main choices one branching decisions in the story and the other the shop system. 

**Shop System Branching Choices**

This shop system allows the user to interact with an NPC giving them an experience of trying to figure out **MUCH LIKE STLOROS** if they should spend money on a more powerful weapon increase there health and buy and Expensive shield as they ahve already acquired a weapon and have max health. They also may choose to upgrade their weapon to evolve it into somthing more powerful. However not showing what a weapon can evolve into also makes the user hesitant to upgrade and evolve and may instead use there money to buy a new weapon restarting their progreess in hopes to find a more powerful upgrade. 

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

GMAJ0R (2023). *A glimpse of the mid game skill tree.* [online] Reddit. Available at: https://www.reddit.com/r/FFXVI/comments/1229p9y/potential_spoilers_yoship_accidentally_showed_a/ [Accessed 23 Aug. 2024].

www.merriam-webster.com. (n.d.). *Definition of SANDBOX.* [online] Available at: https://www.merriam-webster.com/dictionary/sandbox#:~:text=%3A%20a%20video%20game%20or%20part.(www.merriam-webster.com, n.d.)

‌

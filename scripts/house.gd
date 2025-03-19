extends Control
@onready var day_label: Label = $StatusBar/HBoxContainer/DayTime/days/DayLabel
@onready var time_slot_label: Label = $StatusBar/HBoxContainer/DayTime/TimeSlot/TimeSlotLabel
@onready var trust_label: Label = $StatusBar/HBoxContainer/GirlStats/Trust/TrustLabel
@onready var mood_label: Label = $StatusBar/HBoxContainer/GirlStats/Mood/MoodLabel
@onready var hunger_progress_bar: ProgressBar = $StatusBar/HBoxContainer/GirlStats/Hunger/HungerProgressBar
@onready var str_label: Label = $StatusBar/HBoxContainer/PlayerStats/STR/STRLabel
@onready var dex_label: Label = $StatusBar/HBoxContainer/PlayerStats/DEX/DEXLabel
@onready var def_label: Label = $StatusBar/HBoxContainer/PlayerStats/DEF/DEFLabel
@onready var spd_label: Label = $StatusBar/HBoxContainer/PlayerStats/SPD/SPDLabel
@onready var hp_label: Label = $StatusBar/HBoxContainer/PlayerStats/HP/HPLabel
@onready var gold_label: Label = $StatusBar/HBoxContainer/PlayerStats/gold/GoldLabel
@onready var settings: Control = $Settings
@onready var dialog_box: DialogBox = $CanvasLayer/DialogBox
@onready var shopping: Panel = $Shop/Shopping
@onready var weapon_menu: Panel = $Shop/WeaponMenu
@onready var armor_menu: Panel = $Shop/ArmorMenu
@onready var food_menu: Panel = $Shop/FoodMenu
@onready var gift_menu: Panel = $Shop/GiftMenu
@onready var potion_menu: Panel = $Shop/PotionMenu
@onready var confirmation_dialog: ConfirmationDialog = $Shop/ConfirmationDialog
@onready var settings_button: TextureButton = $Activities/Activities2/SettingsButton
@onready var item_desc_panel: Panel = $Shop/ItemDescPanel
@onready var title_l: Label = $Shop/ItemDescPanel/MarginContainer/VBoxContainer/titleL
@onready var text_1l: Label = $Shop/ItemDescPanel/MarginContainer/VBoxContainer/text1L
@onready var text_2l: Label = $Shop/ItemDescPanel/MarginContainer/VBoxContainer/text2L
@onready var text_3l: Label = $Shop/ItemDescPanel/MarginContainer/VBoxContainer/text3L
@onready var text_4l: Label = $Shop/ItemDescPanel/MarginContainer/VBoxContainer/text4L
@onready var wood_s_btn: Button = $Shop/WeaponMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/WoodSBtn
@onready var stone_s_btn: Button = $Shop/WeaponMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/StoneSBtn
@onready var weapon_btn: Button = $Shop/Shopping/MarginContainer/VBoxContainer/VBoxContainer/WeaponBtn
@onready var armor_btn: Button = $Shop/Shopping/MarginContainer/VBoxContainer/VBoxContainer/ArmorBtn
@onready var food_btn: Button = $Shop/Shopping/MarginContainer/VBoxContainer/VBoxContainer/FoodBtn
@onready var gift_btn: Button = $Shop/Shopping/MarginContainer/VBoxContainer/VBoxContainer/GiftBtn
@onready var potion_btn: Button = $Shop/Shopping/MarginContainer/VBoxContainer/VBoxContainer/PotionBtn
@onready var exit_weapon_btn: Button = $Shop/WeaponMenu/ScrollContainer/MarginContainer/VBoxContainer/ExitWeaponBtn
@onready var exit_armor_btn: Button = $Shop/ArmorMenu/ScrollContainer/MarginContainer/VBoxContainer/ExitArmorBtn
@onready var exit_food_btn: Button = $Shop/FoodMenu/ScrollContainer/MarginContainer/VBoxContainer/ExitFoodBtn
@onready var exit_gift_btn: Button = $Shop/GiftMenu/ScrollContainer/MarginContainer/VBoxContainer/ExitGiftBtn
@onready var exit_potion_btn: Button = $Shop/PotionMenu/ScrollContainer/MarginContainer/VBoxContainer/ExitPotionBtn
@onready var ore_s_btn: Button = $Shop/WeaponMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/OreSBtn
@onready var iron_s_btn: Button = $Shop/WeaponMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/IronSBtn
@onready var silver_s_btn: Button = $Shop/WeaponMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/SilverSBtn
@onready var ultima_s_btn: Button = $Shop/WeaponMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/UltimaSBtn
@onready var wood_b_btn: Button = $Shop/WeaponMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/WoodBBtn
@onready var stone_b_btn: Button = $Shop/WeaponMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/StoneBBtn
@onready var ore_b_btn: Button = $Shop/WeaponMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/OreBBtn
@onready var iron_b_btn: Button = $Shop/WeaponMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/IronBBtn
@onready var silver_b_btn: Button = $Shop/WeaponMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/SilverBBtn
@onready var ultima_b_btn: Button = $Shop/WeaponMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/UltimaBBtn
@onready var wood_a_btn: Button = $Shop/ArmorMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/WoodABtn
@onready var stone_a_btn: Button = $Shop/ArmorMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/StoneABtn
@onready var ore_a_btn: Button = $Shop/ArmorMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/OreABtn
@onready var iron_a_btn: Button = $Shop/ArmorMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/IronABtn
@onready var silver_a_btn: Button = $Shop/ArmorMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/SilverABtn
@onready var ultima_a_btn: Button = $Shop/ArmorMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/UltimaABtn
@onready var ration_btn: Button = $Shop/FoodMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/RationBtn
@onready var canned_btn: Button = $Shop/FoodMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/CannedBtn
@onready var fruits_btn: Button = $Shop/FoodMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/FruitsBtn
@onready var candies_btn: Button = $Shop/FoodMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/CandiesBtn
@onready var snacks_btn: Button = $Shop/FoodMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/SnacksBtn
@onready var decent_btn: Button = $Shop/FoodMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/DecentBtn
@onready var home_btn: Button = $Shop/FoodMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/HomeBtn
@onready var expensive_btn: Button = $Shop/FoodMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/ExpensiveBtn
@onready var noble_btn: Button = $Shop/FoodMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/NobleBtn
@onready var wooden_btn: Button = $Shop/GiftMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/WoodenBtn
@onready var marbles_btn: Button = $Shop/GiftMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/MarblesBtn
@onready var crayon_btn: Button = $Shop/GiftMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/CrayonBtn
@onready var rag_btn: Button = $Shop/GiftMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/RagBtn
@onready var story_btn: Button = $Shop/GiftMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/StoryBtn
@onready var chess_btn: Button = $Shop/GiftMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/ChessBtn
@onready var well_btn: Button = $Shop/GiftMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/WellBtn
@onready var magic_s_btn: Button = $Shop/GiftMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/MagicSBtn
@onready var str_potion_btn: Button = $Shop/PotionMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/StrPotionBtn
@onready var dex_potion_btn: Button = $Shop/PotionMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/DexPotionBtn
@onready var def_potion_btn: Button = $Shop/PotionMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/DefPotionBtn
@onready var spd_potion_btn: Button = $Shop/PotionMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/SpdPotionBtn
@onready var hp_potion_btn: Button = $Shop/PotionMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/HpPotionBtn
@onready var ult_potion_btn: Button = $Shop/PotionMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/UltPotionBtn
@onready var work: Control = $Work
@onready var work_button: TextureButton = $Activities/Activities/WorkButton
@onready var forest_btn: Button = $Work/Places/MarginContainer/VBoxContainer/VBoxContainer/ForestBtn
@onready var dungeon_btn: Button = $Work/Places/MarginContainer/VBoxContainer/VBoxContainer/DungeonBtn
@onready var city_btn: Button = $Work/Places/MarginContainer/VBoxContainer/VBoxContainer/CityBtn
@onready var castle_btn: Button = $Work/Places/MarginContainer/VBoxContainer/VBoxContainer/CastleBtn
@onready var talk: Control = $Talk
@onready var eat: Control = $Eat
@onready var shop_button: TextureButton = $Activities/Activities/ShopButton
@onready var talk_button: TextureButton = $Activities/Activities/TalkButton
@onready var eat_button: TextureButton = $Activities/Activities/EatButton
@onready var end_of_content: AcceptDialog = $EndOfContent
@onready var eat_ration_btn: Button = $Eat/EatMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/EatRationBtn
@onready var eat_canned_btn: Button = $Eat/EatMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/EatCannedBtn
@onready var eat_fruits_btn: Button = $Eat/EatMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/EatFruitsBtn
@onready var eat_candies_btn: Button = $Eat/EatMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/EatCandiesBtn
@onready var eat_snacks_btn: Button = $Eat/EatMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/EatSnacksBtn
@onready var eat_decent_btn: Button = $Eat/EatMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/EatDecentBtn
@onready var eat_home_btn: Button = $Eat/EatMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/EatHomeBtn
@onready var eat_expensive_btn: Button = $Eat/EatMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/EatExpensiveBtn
@onready var eat_noble_btn: Button = $Eat/EatMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/EatNobleBtn
@onready var life_btn: Button = $Talk/Talking/MarginContainer/VBoxContainer/VBoxContainer/lifeBtn
@onready var small_btn: Button = $Talk/Talking/MarginContainer/VBoxContainer/VBoxContainer/smallBtn
@onready var play_btn: Button = $Talk/Talking/MarginContainer/VBoxContainer/VBoxContainer/playBtn
@onready var give_btn: Button = $Talk/Talking/MarginContainer/VBoxContainer/VBoxContainer/giveBtn
@onready var give_wooden_btn: Button = $Talk/GiveGiftMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/GiveWoodenBtn
@onready var give_marbles_btn: Button = $Talk/GiveGiftMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/GiveMarblesBtn
@onready var give_crayon_btn: Button = $Talk/GiveGiftMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/GiveCrayonBtn
@onready var give_rag_btn: Button = $Talk/GiveGiftMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/GiveRagBtn
@onready var give_story_btn: Button = $Talk/GiveGiftMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/GiveStoryBtn
@onready var give_chess_btn: Button = $Talk/GiveGiftMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/GiveChessBtn
@onready var give_well_btn: Button = $Talk/GiveGiftMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/GiveWellBtn
@onready var give_magic_s_btn: Button = $Talk/GiveGiftMenu/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer/GiveMagicSBtn
@onready var give_gift_menu: Panel = $Talk/GiveGiftMenu
@onready var talking: Panel = $Talk/Talking
@onready var sleep_button: TextureButton = $Activities/Activities2/SleepButton
@onready var items_button: TextureButton = $Activities/Activities2/ItemsButton
@onready var menu_button: TextureButton = $Activities/Activities2/MenuButton
@onready var bgm: Bgm = $Bgm

var button_map_give
var button_map_eat
var time_slot = 1
const BASE_PRICE = 100
const BASE_STAT_UP = 10

func _ready() -> void:
	get_tree().paused = false
	bgm.play_audio(8)
	time_slot = SaveManager.stats.day_time
	
	#entering menus shop
	weapon_btn.pressed.connect(func(): _toggle_menu(weapon_menu, true))
	armor_btn.pressed.connect(func(): _toggle_menu(armor_menu, true))
	food_btn.pressed.connect(func(): _toggle_menu(food_menu, true))
	gift_btn.pressed.connect(func(): _toggle_menu(gift_menu, true))
	potion_btn.pressed.connect(func(): _toggle_menu(potion_menu, true))
	
	#exiting menus shop
	exit_weapon_btn.pressed.connect(func(): _toggle_menu(weapon_menu, false))
	exit_armor_btn.pressed.connect(func(): _toggle_menu(armor_menu, false))
	exit_food_btn.pressed.connect(func(): _toggle_menu(food_menu, false))
	exit_gift_btn.pressed.connect(func(): _toggle_menu(gift_menu, false))
	exit_potion_btn.pressed.connect(func(): _toggle_menu(potion_menu, false))
	
	#work levels description panel
	connect_work_button(forest_btn, 'Forest', 'A calm forest dividing the two realms', 'Easy', '5 minutes', 'res://scenes/forest.tscn')
	connect_work_button(dungeon_btn, 'Dungeon', 'The dungeon where captured humans works', 'Medium', '10 minutes', '')
	connect_work_button(city_btn, 'City', 'The monster capital, located in the center of their realm', 'Hard', '20 minutes', '')
	connect_work_button(castle_btn, 'Castle', 'The king monster castle where the strongest lies', 'Death', '30 minutes', '')
	
	#signal for buying items
	#swords
	connect_item_button(wood_s_btn, "Wood Sword", 0.5, "str", 0.5, 1)
	connect_item_button(stone_s_btn, "Stone Sword", 1.0, "str", 1.0, 1)
	connect_item_button(ore_s_btn, "Ore Sword", 2, "str", 2, 1)
	connect_item_button(iron_s_btn, "Iron Sword", 3.5, "str", 3.5, 1)
	connect_item_button(silver_s_btn, "Silver Sword", 5, "str", 5, 1)
	connect_item_button(ultima_s_btn, "Ultima Sword", 9, "str", 9, 1)
	#bows
	connect_item_button(wood_b_btn, "Wood Bow", 0.5, "dex", 0.5, 1)
	connect_item_button(stone_b_btn, "Stone Bow", 1.0, "dex", 1.0, 1)
	connect_item_button(ore_b_btn, "Ore Bow", 2, "dex", 2, 1)
	connect_item_button(iron_b_btn, "Iron Bow", 3.5, "dex", 3.5, 1)
	connect_item_button(silver_b_btn, "Silver Bow", 5, "dex", 5, 1)
	connect_item_button(ultima_b_btn, "Ultima Bow", 9, "dex", 9, 1)
	#armor
	connect_item_button(wood_a_btn, "Wood Armor", 0.5, "def", 0.5, 1)
	connect_item_button(stone_a_btn, "Stone Armor", 1.0, "def", 1.0, 1)
	connect_item_button(ore_a_btn, "Ore Armor", 2, "def", 2, 1)
	connect_item_button(iron_a_btn, "Iron Armor", 3.5, "def", 3.5, 1)
	connect_item_button(silver_a_btn, "Silver Armor", 5, "def", 5, 1)
	connect_item_button(ultima_a_btn, "Ultima Armor", 9, "def", 9, 1)
	#food & eat
	connect_buttons(ration_btn, eat_ration_btn, 'Militar Ration', 0.05, 'satiety', 2.5, 100)
	connect_buttons(canned_btn, eat_canned_btn, 'Canned Food', 0.15, 'satiety', 3.5, 100)
	connect_buttons(fruits_btn, eat_fruits_btn, 'Fruits', 0.35, 'satiety', 0.5, 100)
	connect_buttons(candies_btn, eat_candies_btn, 'Candies', 0.55, 'satiety', 1, 100)
	connect_buttons(snacks_btn, eat_snacks_btn, 'Snacks', 0.25, 'satiety', 1.5, 100)
	connect_buttons(decent_btn, eat_decent_btn, 'Decent Meal', 0.39, 'satiety', 7, 100)
	connect_buttons(home_btn, eat_home_btn, 'Homemade Meal', 0.45, 'satiety', 7.5, 100)
	connect_buttons(expensive_btn, eat_expensive_btn, 'Expensive Meal', 0.75, 'satiety', 8.5, 100)
	connect_buttons(noble_btn, eat_noble_btn, 'Noble Meal', 1.2, 'satiety', 0.95, 100)
	#gift & give
	connect_buttons_give(wooden_btn, give_wooden_btn, 'Wooden Doll', 0.50, 'trust', 2.0, 100)
	connect_buttons_give(marbles_btn, give_marbles_btn, 'Marbles', 0.35, 'trust', 1.7, 100)
	connect_buttons_give(crayon_btn, give_crayon_btn, 'Crayon', 0.80, 'trust', 4.5, 100)
	connect_buttons_give(rag_btn, give_rag_btn, 'Rag Doll', 0.99, 'trust', 7, 100)
	connect_buttons_give(story_btn, give_story_btn, 'Storybook', 1.55, 'trust', 8.5, 100)
	connect_buttons_give(chess_btn, give_chess_btn, 'Chess', 3.39, 'trust', 10, 100)
	connect_buttons_give(well_btn, give_well_btn, 'Well Made Doll', 5.45, 'trust', 12.5, 100)
	connect_buttons_give(magic_s_btn, give_magic_s_btn, 'Magicstation', 9.75, 'trust', 28.5, 100)
	#potion
	connect_item_button(str_potion_btn, "STR Potion", 3, "str", 2, 100)
	connect_item_button(dex_potion_btn, "DEX Potion", 3, "dex", 2, 100)
	connect_item_button(def_potion_btn, "DEF Potion", 3, "def", 2, 100)
	connect_item_button(spd_potion_btn, "SPD Potion", 3, "spd", 2, 100)
	connect_item_button(hp_potion_btn, "HP Potion", 3, "hp", 2, 100)
	connect_item_button(ult_potion_btn, "ULTIMA Potion", 9, "random", 1, 100)
	if not SaveManager.stats.events['Tutorial']:
		dialog_box.is_dialog_started = true
		dialog_box.dialog_index = 1
		SaveManager.stats.events['Tutorial'] = true

	button_map_give = {
		give_wooden_btn: "Wooden Doll",
		give_marbles_btn: "Marbles",
		give_crayon_btn: "Crayon",
		give_rag_btn: "Rag Doll",
		give_story_btn: "Storybook",
		give_chess_btn: "Chess",
		give_well_btn: "Well Made Doll",
		give_magic_s_btn: "Magicstation",
	}
	
	button_map_eat = {
		eat_ration_btn: "Militar Ration",
		eat_canned_btn: "Canned Food",
		eat_fruits_btn: "Fruits",
		eat_candies_btn: "Candies",
		eat_snacks_btn: "Snacks",
		eat_decent_btn: "Decent Meal",
		eat_home_btn: "Homemade Meal",
		eat_expensive_btn: "Expensive Meal",
		eat_noble_btn: "Noble Meal"
		}
	
func _process(_delta: float) -> void:
	pass_time()
	determine_mood()
	determine_trust()
	init_status()


func set_visibility_buttons(button_map: Dictionary):
	for button in button_map.keys():
		if button_map[button] in SaveManager.stats.inventory and SaveManager.stats.inventory[button_map[button]].quantity > 0:
			button.visible = true
		else:
			button.visible = false


func connect_buttons_give(button1: Button, button2: Button, nome: String, price_multiplier: float, stat_type: String, stat_multiplier: float, quantity: int):
	connect_item_button(button1, nome, price_multiplier, stat_type, stat_multiplier, quantity)
	connect_give_button(button2, nome, stat_multiplier, price_multiplier)
	

func connect_give_button(button: Button, nome: String, stat_multiplier: float, price_multiplier: float):
	var stat_value = int(BASE_STAT_UP * stat_multiplier)
	var stat_text = "Trust +%d" % stat_value
	var price = int(BASE_PRICE * price_multiplier)
	var price_text = "Mood +%d " % price
	
	button.pressed.connect(func(): _on_give_item_btn_pressed(nome, stat_value, price))
	button.mouse_entered.connect(func(): _on_give_item_btn_mouse_entered(button, nome, price_text, stat_text))
	button.mouse_exited.connect(func(): _on_item_btn_mouse_exited())
	
			
func connect_buttons(button1: Button, button2: Button, nome: String, price_multiplier: float, stat_type: String, stat_multiplier: float, quantity: int):
	connect_item_button(button1, nome, price_multiplier, stat_type, stat_multiplier, quantity)
	connect_eat_button(button2, nome, stat_type, stat_multiplier, price_multiplier)

func connect_work_button(button: Button, title: String, description: String, difficulty: String, time: String, scene: String):
	button.pressed.connect(func (): _on_work_btn_pressed(scene))
	button.mouse_entered.connect(func(): _on_work_btn_mouse_entered(button, title, description, difficulty, time))
	button.mouse_exited.connect(func(): _on_item_btn_mouse_exited())


func connect_eat_button(button: Button, nome: String, stat_type: String, stat_multiplier: float, price_multiplier: float):
	var stat_value = int(BASE_STAT_UP * stat_multiplier)
	var stat_text = "%s +%d" % [stat_type.to_upper(), stat_value]
	var price = int(BASE_PRICE * price_multiplier)
	var price_text = "Mood +%d " % price
	
	button.pressed.connect(func(): _on_eat_btn_pressed(nome, stat_value, price))
	button.mouse_entered.connect(func(): _on_eat_btn_mouse_entered(button, name, stat_text, price_text))
	button.mouse_exited.connect(func(): _on_item_btn_mouse_exited())

func connect_item_button(button: Button, nome: String, price_multiplier: float, stat_type: String, stat_multiplier: float, quantity: int):

	var price = int(BASE_PRICE * price_multiplier)
	var stat_value = int(BASE_STAT_UP * stat_multiplier)
	var stat_text = "%s +%d" % [stat_type.to_upper(), stat_value]
	var price_text = "%d Gold" % price

	button.pressed.connect(func(): _on_item_btn_pressed(nome, price, stat_type, stat_value, quantity))
	button.mouse_entered.connect(func(): _on_item_btn_mouse_entered(button, nome, stat_text, price_text))
	button.mouse_exited.connect(_on_item_btn_mouse_exited)

func determine_mood():
	var mood = SaveManager.stats.girl_stats['mood']
	
	if mood < 100:
		mood_label.text = SaveManager.stats.girl_mood.find_key(0)
	elif mood < 200:
		mood_label.text = SaveManager.stats.girl_mood.find_key(1)
	elif mood < 300:
		mood_label.text = SaveManager.stats.girl_mood.find_key(2)
	elif mood < 400:
		mood_label.text = SaveManager.stats.girl_mood.find_key(3)
	elif mood < 500:
		mood_label.text = SaveManager.stats.girl_mood.find_key(4)
	elif mood < 600:
		mood_label.text = SaveManager.stats.girl_mood.find_key(5)
	elif mood < 700:
		mood_label.text = SaveManager.stats.girl_mood.find_key(6)
	elif mood < 800:
		mood_label.text = SaveManager.stats.girl_mood.find_key(7)
	elif mood < 900:
		mood_label.text = SaveManager.stats.girl_mood.find_key(8)
	elif mood < 1000:
		mood_label.text = SaveManager.stats.girl_mood.find_key(9)

func determine_trust():
	var trust = SaveManager.stats.girl_stats['trust']
	
	if trust < 100:
		trust_label.text = SaveManager.stats.girl_trust.find_key(0)
	elif trust < 200:
		trust_label.text = SaveManager.stats.girl_trust.find_key(1)
	elif trust < 300:
		trust_label.text = SaveManager.stats.girl_trust.find_key(2)
	elif trust < 400:
		trust_label.text = SaveManager.stats.girl_trust.find_key(3)
	elif trust < 500:
		trust_label.text = SaveManager.stats.girl_trust.find_key(4)
	elif trust < 600:
		trust_label.text = SaveManager.stats.girl_trust.find_key(5)
	elif trust < 700:
		trust_label.text = SaveManager.stats.girl_trust.find_key(6)
	elif trust < 800:
		trust_label.text = SaveManager.stats.girl_trust.find_key(7)
	elif trust < 900:
		trust_label.text = SaveManager.stats.girl_trust.find_key(8)
	elif trust < 1000:
		trust_label.text = SaveManager.stats.girl_trust.find_key(9)

func night():
	work_button.disabled = true
	shop_button.disabled = true
	talk_button.disabled = true
	eat_button.disabled = true
	sleep_button.disabled = false

func pass_time():
	if time_slot == 1:
		time_slot_label.text = 'Morning'
	elif time_slot == 2:
		time_slot_label.text = 'Afternoon'
	elif time_slot == 3:
		time_slot_label.text = 'Evening'
	elif time_slot >= 4:
		time_slot_label.text = 'Night'
		night()
		
func init_status():
	day_label.text = str(SaveManager.stats.days)
	str_label.text = str(SaveManager.stats.player_stats["str"])
	dex_label.text = str(SaveManager.stats.player_stats["dex"])
	def_label.text = str(SaveManager.stats.player_stats["def"])
	spd_label.text = str(SaveManager.stats.player_stats["spd"])
	hp_label.text = str(round(SaveManager.stats.player_stats["hp"]))
	gold_label.text = str(SaveManager.stats.gold)
	hunger_progress_bar.value = SaveManager.stats.girl_stats['hunger']

func show_desc(button: Button, title: String, text1: String, text2: String, text3: String, text4: String):
	item_desc_panel.position = Vector2(button.position.x + 620, button.position.y + 30)
	title_l.text = title
	text_1l.text = text1
	text_2l.text = text2
	text_3l.text = text3
	text_4l.text = text4
	item_desc_panel.show()

func girl_stat_change(trust: int, mood: int, hunger: int):
	SaveManager.stats.add_stat('trust', trust, SaveManager.stats.girl_stats)
	SaveManager.stats.add_stat('mood', mood, SaveManager.stats.girl_stats)
	SaveManager.stats.add_stat('hunger', hunger, SaveManager.stats.girl_stats)
	if (SaveManager.stats.girl_stats['hunger'] <= 0):
		SaveManager.stats.add_stat('trust', -5, SaveManager.stats.girl_stats)
		SaveManager.stats.add_stat('mood', -10, SaveManager.stats.girl_stats)

func choose_dialogue(index: int):
	dialog_box.is_dialog_started = true
	dialog_box.dialog_index = index
	
func _on_work_button_pressed() -> void:
	ButtonSound.play_click_sound()
	if work.is_visible_in_tree():
		work.visible = false
		for button in get_tree().get_nodes_in_group('Buttons'):
			button.disabled = false
	else:
		work.visible = true
		for button in get_tree().get_nodes_in_group('Buttons'):
			button.disabled = true
		work_button.disabled = false

func _on_shop_button_pressed() -> void:
	ButtonSound.play_click_sound()
	shopping.visible = true
	for button in get_tree().get_nodes_in_group('Buttons'):
		button.disabled = true

func _on_talk_button_pressed() -> void:
	ButtonSound.play_click_sound()
	talk.visible = true
	for button in get_tree().get_nodes_in_group('Buttons'):
		button.disabled = true

func _on_eat_button_pressed() -> void:
	ButtonSound.play_click_sound()
	if eat.is_visible_in_tree():
		eat.visible = false
		for button in get_tree().get_nodes_in_group('Buttons'):
			button.disabled = false
	else:
		eat.visible = true
		for button in get_tree().get_nodes_in_group('Buttons'):
			button.disabled = true
		eat_button.disabled = false
		set_visibility_buttons(button_map_eat)

func sleep():
	choose_dialogue(24)
	time_slot = 1
	SaveManager.stats.days += 1
	day_label.text = str(SaveManager.stats.days)
	SaveManager.save_game()

func _on_sleep_button_pressed() -> void:
	girl_stat_change(0, 0, randi_range(-10, -20))
	ButtonSound.play_click_sound()
	sleep()

func _on_menu_button_pressed() -> void:
	SaveManager.stats.day_time = 1
	SaveManager.save_game()
	ButtonSound.play_click_sound()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	 
func _on_dialog_box_dialog_finished() -> void:
	for button in get_tree().get_nodes_in_group('Buttons'):
		button.disabled = false

func _on_dialog_box_dialog_running() -> void:
	for button in get_tree().get_nodes_in_group('Buttons'):
		button.disabled = true


func _on_settings_button_pressed() -> void:
	ButtonSound.play_click_sound()
	if settings.is_visible_in_tree():
		settings.visible = false
		for button in get_tree().get_nodes_in_group('Buttons'):
			button.disabled = false
	else:
		settings.visible = true
		for button in get_tree().get_nodes_in_group('Buttons'):
			button.disabled = true
		settings_button.disabled = false
		
func _on_exit_shop_btn_pressed() -> void:
	ButtonSound.play_click_sound()
	confirmation_dialog.popup_centered()
	
func _on_confirmation_dialog_confirmed() -> void:
	ButtonSound.play_click_sound()
	time_slot += 1
	shopping.visible = false
	girl_stat_change(0, 0, randi_range(-20, -30))
	for button in get_tree().get_nodes_in_group('Buttons'):
		button.disabled = false

func _toggle_menu(menu: Control, show_menu: bool) -> void:
	shopping.visible = not show_menu
	menu.visible = show_menu

func _on_give_item_btn_pressed(item: String, trust: int, mood: int):
	ButtonSound.play_click_sound()
	if SaveManager.stats.girl_stats['trust'] > 100 and SaveManager.stats.girl_stats['mood'] > 100:
		if SaveManager.stats.events[item] == false:
			SaveManager.stats.events[item] = true
			if item == 'Marbles':
				choose_dialogue(46)
			elif item == 'Chess':
				choose_dialogue(71)
			elif item == 'Rag Doll':
				choose_dialogue(91)
			elif item == 'Crayon':
				choose_dialogue(106)
			elif item == 'Storybook':
				choose_dialogue(119)
			elif item == 'Magicstation':
				choose_dialogue(139)
			elif item == 'Wooden Doll':
				choose_dialogue(158)
			elif item == 'Well Made Doll':
				choose_dialogue(170)
		else:
			if SaveManager.stats.girl_stats['trust'] < 200:
				choose_dialogue(62)
			elif SaveManager.stats.girl_stats['trust'] < 400:
				choose_dialogue(65)
			elif SaveManager.stats.girl_stats['trust'] >= 400:
				choose_dialogue(68)
				
		time_slot += 1
		if SaveManager.stats.inventory.has(item):
			SaveManager.stats.remove_item(item)
			girl_stat_change(trust, mood, randi_range(-15, -30))
			set_visibility_buttons(button_map_give)
			
		if SaveManager.stats.inventory.has(item):
			text_3l.text = 'Owned: %d' % SaveManager.stats.inventory[item].quantity
		else:
			text_3l.text = 'Owned: 0'
			
		give_gift_menu.visible = false
		talking.visible = true
		exit_talk()
	else:
		choose_dialogue(59)

func _on_give_item_btn_mouse_entered(button: Button, title: String, trust: String, mood: String):
	var owned = 'Owned: ' + str(SaveManager.stats.inventory[title].quantity) if SaveManager.stats.inventory.has(title) else 'Owned: 0'
	show_desc(button, title, trust, mood, owned, '')

func _on_eat_btn_pressed(item: String, hunger: int, mood: int):
	ButtonSound.play_click_sound()
	if SaveManager.stats.inventory.has(item) and hunger_progress_bar.value < 100:
		SaveManager.stats.remove_item(item)
		girl_stat_change(0, mood, hunger)
		set_visibility_buttons(button_map_eat)
	if SaveManager.stats.inventory.has(item):
		text_3l.text = 'Owned: %d' % SaveManager.stats.inventory[item].quantity
	else:
		text_3l.text = 'Owned: 0'

func _on_eat_btn_mouse_entered(button: Button, title: String, satiety: String, mood: String):
	var owned = 'Owned: ' + str(SaveManager.stats.inventory[title].quantity) if SaveManager.stats.inventory.has(title) else 'Owned: 0'
	show_desc(button, title, satiety, mood, owned, '')

func _on_item_btn_pressed(item_name: String, price: int, stat_type: String, stat_value: int, max_amount: int) -> void:
	ButtonSound.play_click_sound()
	if stat_type == 'random':
		var types = {1 : 'str', 2 : 'def', 3 : 'spd', 4 : 'dex', 5 : 'hp'}
		SaveManager.stats.add_stat(types[randi_range(1, 5)], stat_value, SaveManager.stats.player_stats)
	else:
		SaveManager.stats.add_item(item_name, price, stat_type, stat_value, max_amount)
	if SaveManager.stats.inventory.has(item_name):
		text_3l.text = 'Owned: %d' % SaveManager.stats.inventory[item_name].quantity
	else:
		text_3l.text = 'Owned: 0'

func _on_item_btn_mouse_entered(button: Button, item: String, stat_desc: String, price: String) -> void:
	var owned = 'Owned: ' + str(SaveManager.stats.inventory[item].quantity) if SaveManager.stats.inventory.has(item) else 'Owned: 0'
	show_desc(button, item, stat_desc, price, owned, '')

func _on_item_btn_mouse_exited() -> void:
	item_desc_panel.hide()

func _on_work_btn_pressed(scene: String) -> void:
	ButtonSound.play_click_sound()
	if scene == '':
		end_of_content.popup_centered()
	else:
		time_slot += 1
		SaveManager.stats.day_time = time_slot
		girl_stat_change(0, randi_range(-10, 10), randi_range(-30, -20))
		get_tree().change_scene_to_file(scene)

func _on_work_btn_mouse_entered(button: Button, title: String, description: String, difficulty: String, time: String) -> void:
	show_desc(button, title, description, difficulty, time, '')

func _on_exit_work_btn_pressed() -> void:
	ButtonSound.play_click_sound()
	work.visible = false
	for button in get_tree().get_nodes_in_group('Buttons'):
		button.disabled = false


func _on_exit_talk_btn_pressed() -> void:
	ButtonSound.play_click_sound()
	exit_talk()


func _on_exit_eat_btn_pressed() -> void:
	ButtonSound.play_click_sound()
	eat.visible = false
	for button in get_tree().get_nodes_in_group('Buttons'):
		button.disabled = false


func _on_give_btn_pressed() -> void:
	ButtonSound.play_click_sound()
	give_gift_menu.visible = true
	talking.visible = false
	set_visibility_buttons(button_map_give)


func _on_exit_give_gift_btn_pressed() -> void:
	ButtonSound.play_click_sound()
	give_gift_menu.visible = false
	talking.visible = true

func exit_talk():
	ButtonSound.play_click_sound()
	talk.visible = false
	for button in get_tree().get_nodes_in_group('Buttons'):
		button.disabled = false

func _on_small_btn_pressed() -> void:
	ButtonSound.play_click_sound()
	if time_slot == 1:
		choose_dialogue(15)
	elif time_slot == 2:
		choose_dialogue(18)
	elif time_slot == 3:
		choose_dialogue(21)
	girl_stat_change(randi_range(20, 50), randi_range(20, 40), randi_range(-20, -30))
	exit_talk()
	time_slot += 1


func _on_play_btn_pressed() -> void:
	ButtonSound.play_click_sound()
	var choice = randi_range(1, 4)
	if choice == 1:
		choose_dialogue(27)
	elif choice == 2:
		choose_dialogue(30)
	elif choice == 3:
		choose_dialogue(33)
	elif choice == 4:
		choose_dialogue(36)
	girl_stat_change(randi_range(30, 70), randi_range(30, 60), randi_range(-25, -40))
	exit_talk()
	time_slot += 1


func _on_life_btn_pressed() -> void:
	ButtonSound.play_click_sound()
	if SaveManager.stats.girl_stats['trust'] > 300 and SaveManager.stats.girl_stats['mood'] > 300:
		if SaveManager.stats.events['Birthday'] == false:
			choose_dialogue(178)
			girl_stat_change(50, 50, randi_range(-15, -30))
			time_slot += 1
			exit_talk()
			SaveManager.stats.events['Birthday'] == true
		else:
			choose_dialogue(40)
	else:
		choose_dialogue(43)


func _on_items_button_pressed() -> void:
	end_of_content.popup_centered()

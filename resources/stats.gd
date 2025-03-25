extends Resource
class_name Stats

const MAX_STATS = 999
const MAX_GOLD = 999999999
const MIN = 0

#player Stats
@export var player_stats = {'hp' : 100.0, 'str' : 20, 'def' : 20, 'dex' : 20, 'spd' : 20.0, 'regen' : 1, 'max_hp' : 100.0}
@export var gold = 100

#Girl Stats
@export var girl_stats = {'mood' : 1, 'trust' : 1, 'hunger' : 100}
@export var girl_mood = {'Depressed' : 0, 'Sad' : 1, 'Disappointed' : 2, 'Anxious' : 3, 'Indifferent' : 4, 'Content' : 5, 'Curious' : 6, 'Hopeful' : 7, 'Grateful' : 8, 'Cheerful ' : 9}
@export var girl_trust = {'Stranger' : 0, 'Distrustful' : 1, 'Cautious' : 2, 'Wary' : 3, 'Neutral' : 4, 'Acquainted' : 5, 'Reliable' : 6, 'Confident' : 7, 'Trustful' : 8, 'Ride-or-Die' : 9}

#Events
@export var events = {'Tutorial' : false, 'Wooden Doll' : false, 'Marbles' : false, 'Crayon' : false, 'Rag Doll' : false, 'Storybook' : false, 'Chess' : false, 
'Well Made Doll' : false, 'Magicstation' : false, 'Birthday' : false}

#System Stats
@export var day_time = 1
@export var days = 1

#Enemies Stats
@export var slime_stats = {'hp' : 73, 'dmg' : 17.0, 'def' : 4, 'spd' : 300.0}
@export var globin_stats = {'hp' : 135, 'dmg' : 40.0, 'def' : 15, 'spd' : 350.0}

#Level Stats
@export var kill_count = 0
@export var damage_taken = 0
@export var damage_given = 0
@export var coins_earned = 0

# Player inventory
@export var inventory: Dictionary = {}

# Add item to inventory if the player have the money and the item hasn't reached it's max value
func add_item(item_name: String, price: int, stat: String, value: int, max_stack: int = 100):
	if gold >= price and (not inventory.has(item_name) or inventory[item_name].quantity < max_stack):
		sub_gold(price)
		if player_stats.has(stat):
			add_stat(stat, value, player_stats)
		if inventory.has(item_name):
			inventory[item_name].add_quantity(1)
		else:
			inventory[item_name] = Item.new(1, max_stack)

# When using items remove from inventory, if it reaches zero erase inventory entry
func remove_item(item_name: String):
	if inventory.has(item_name):
		inventory[item_name].remove_quantity(1)
		if inventory[item_name].is_empty():
			inventory.erase(item_name)

# Increment player stats respecting max and min stats values
func add_stat(stat: String, value: int, entity: Dictionary):
	if entity.has(stat):
		entity[stat] = clamp(entity[stat] + value, MIN, MAX_STATS)

# Increment gold respecting max and min gold values
func add_gold(value: int):
	gold = clamp(gold + value, MIN, MAX_GOLD)

# Subtract gold respecting max and min gold values
func sub_gold(value: int):
	gold = clamp(gold - value, MIN, MAX_GOLD)

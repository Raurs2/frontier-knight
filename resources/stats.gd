extends Node
class_name Stats

const MAX_STATS = 999
const MAX_GOLD = 999999999
const MIN_STATS = 0
const MIN_GOLD = 0
#player Stats
@export var player_stats = {'hp' : 100.0, 'str' : 20, 'def' : 10, 'dex' : 20, 'spd' : 10}
@export var gold = 100

#Girl Stats
@export var girl_stats = {'mood' : 1, 'trust' : 1, 'hunger' : 100}
@export var girl_mood = {'Depressed' : 0, 'Sad' : 1, 'Disappointed' : 2, 'Anxious' : 3, 'Indifferent' : 4, 'Content' : 5, 'Curious' : 6, 'Hopeful' : 7, 'Grateful' : 8, 'Cheerful ' : 9}
@export var girl_trust = {'Stranger' : 0, 'Distrustful' : 1, 'Cautious' : 2, 'Wary' : 3, 'Neutral' : 4, 'Acquainted' : 5, 'Reliable' : 6, 'Confident' : 7, 'Trustful' : 8, 'Ride-or-Die' : 9}

#Events
@export var events = {'Tutorial' : false, 'Wooden Doll' : false, 'Marbles' : false, 'Crayon' : false, 'Rag Doll' : false, 'Storybook' : false, 'Chess' : false, 
'Well Made Doll' : false, 'Magicstation' : false}

#System Stats
@export var day_time = 1
@export var days = 1

#Level Stats
@export var kill_count = 0
@export var damage_taken = 0
@export var damage_given = 0
@export var coins_earned = 0

@export var inventory: Dictionary = {}

func add_item(item_name: String, price: int, stat: String, value: int, max_stack: int = 100):
	if gold >= price and (not inventory.has(item_name) or inventory[item_name].quantity < max_stack):
		sub_gold(price)
		if player_stats.has(stat):
			add_stat(stat, value, player_stats)
		if inventory.has(item_name):
			inventory[item_name].add_quantity(1)
		else:
			inventory[item_name] = Item.new(1, max_stack)

func remove_item(item_name: String):
	if inventory.has(item_name):
		inventory[item_name].remove_quantity(1)
		if inventory[item_name].is_empty():
			inventory.erase(item_name)

func add_stat(stat: String, value: int, entity: Dictionary):
	if entity.has(stat):
		entity[stat] = min(max(entity[stat] + value, MIN_STATS), MAX_STATS)
		
func add_gold(value: int):
	gold = min(max(gold+value, MIN_GOLD), MAX_GOLD)
	
func sub_gold(value: int):
	gold = min(max(gold-value, MIN_GOLD), MAX_GOLD)

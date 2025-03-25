extends Resource

class_name Item

const MAX_STACK = 100

var quantity: int
var max_stack: int

# Class for generate items on the player inventory
func _init(_quantity: int = 1, _max_stack: int = MAX_STACK):
	quantity = _quantity
	max_stack = _max_stack

func add_quantity(amount: int = 1):
	quantity = min(quantity + amount, max_stack)

func remove_quantity(amount: int = 1):
	quantity = max(quantity - amount, 0)

func is_empty() -> bool:
	return quantity <= 0

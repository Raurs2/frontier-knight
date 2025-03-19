extends Resource

class_name Item

var quantity: int
#var value: int
var max_stack: int
const MAX_STACK = 100

func _init(_quantity: int = 1, _max_stack: int = MAX_STACK):
	quantity = _quantity
	#value = _value
	max_stack = _max_stack

func add_quantity(amount: int = 1):
	quantity = min(quantity + amount, max_stack)

func remove_quantity(amount: int = 1):
	quantity = max(quantity - amount, 0)

func is_empty() -> bool:
	return quantity <= 0

extends Node2D

const OBJECTS = [
	preload("res://scenes/bush1.tscn"),
	preload("res://scenes/bush2.tscn"),
	preload("res://scenes/grass1.tscn"),
	preload("res://scenes/grass2.tscn"),
	preload("res://scenes/tree1.tscn"),
	preload("res://scenes/tree2.tscn")
]

const MAP_SIZE = Vector2(20000, 20000)
const GRID_SIZE = 200 
const NUM_OBJECTS = 800

var occupied_positions = {}

# Create a map with black borders as map limit and random placed objects in map
func _ready():
	randomize()
	create_map_boundary()
	create_black_overlay()
	for i in range(NUM_OBJECTS):
		place_random_object()

# Visual delimiter of map end
func create_black_overlay():
	var half_size = MAP_SIZE / 2
	var border_thickness = 10000
	# Top Black Border
	add_black_rect(Vector2(-half_size.x - border_thickness, -half_size.y - border_thickness), Vector2(MAP_SIZE.x + border_thickness * 2, border_thickness))
	# Bottom Black Border
	add_black_rect(Vector2(-half_size.x - border_thickness, half_size.y), Vector2(MAP_SIZE.x + border_thickness * 2, border_thickness))
	# Left Black Border
	add_black_rect(Vector2(-half_size.x - border_thickness, -half_size.y), Vector2(border_thickness, MAP_SIZE.y))
	# Right Black Border
	add_black_rect(Vector2(half_size.x, -half_size.y), Vector2(border_thickness, MAP_SIZE.y))

# Auxiliar function for creating the black borders, create an black rectangle in the desired position and size
func add_black_rect(position, size):
	var rect = ColorRect.new()
	rect.color = Color(0, 0, 0, 1) 
	rect.position = position
	rect.size = size
	rect.z_index = 10
	add_child(rect)

# Delimit map end
func create_map_boundary():
	var boundary = StaticBody2D.new()
	add_child(boundary)
	var border_thickness = 200 
	var half_size = MAP_SIZE / 2
	# Top Border
	add_border(boundary, Vector2(0, -half_size.y - border_thickness / 2), Vector2(MAP_SIZE.x + border_thickness * 2, border_thickness))
	# Bottom Border
	add_border(boundary, Vector2(0, half_size.y + border_thickness / 2), Vector2(MAP_SIZE.x + border_thickness * 2, border_thickness))
	# Left Border
	add_border(boundary, Vector2(-half_size.x - border_thickness / 2, 0), Vector2(border_thickness, MAP_SIZE.y + border_thickness * 2))
	# Right Border
	add_border(boundary, Vector2(half_size.x + border_thickness / 2, 0), Vector2(border_thickness, MAP_SIZE.y + border_thickness * 2))

# Auxiliar function for creating map boundary, create an collision rectangle in the desired position and size
func add_border(parent, position, size):
	var border = CollisionShape2D.new()
	var shape = RectangleShape2D.new()
	shape.size = size
	border.shape = shape
	border.position = position
	parent.add_child(border)

# Place random objects in the map grid
func place_random_object():
	var grid_x = randi_range(-MAP_SIZE.x / 2 / GRID_SIZE, MAP_SIZE.x / 2 / GRID_SIZE) * GRID_SIZE
	var grid_y = randi_range(-MAP_SIZE.y / 2 / GRID_SIZE, MAP_SIZE.y / 2 / GRID_SIZE) * GRID_SIZE
	var grid_position = Vector2(grid_x, grid_y)

	if occupied_positions.has(grid_position): # Prevents placing object at same spot of another one
		return 

	occupied_positions[grid_position] = true  

	var object_scene = OBJECTS[randi() % OBJECTS.size()]
	var object_instance = object_scene.instantiate()
	object_instance.position = grid_position + Vector2(randf_range(-GRID_SIZE/2.0, GRID_SIZE/2.0), randf_range(-GRID_SIZE/2, GRID_SIZE/2))

	add_child(object_instance)

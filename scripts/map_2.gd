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

func _ready():
	randomize()
	for i in range(NUM_OBJECTS):
		place_random_object()

func place_random_object():
	var grid_x = randi_range(-MAP_SIZE.x / 2.0 / GRID_SIZE, MAP_SIZE.x / 2.0 / GRID_SIZE) * GRID_SIZE
	var grid_y = randi_range(-MAP_SIZE.y / 2.0 / GRID_SIZE, MAP_SIZE.y / 2.0 / GRID_SIZE) * GRID_SIZE
	var grid_position = Vector2(grid_x, grid_y)

	if occupied_positions.has(grid_position):
		return 

	occupied_positions[grid_position] = true  

	var object_scene = OBJECTS[randi() % OBJECTS.size()]
	var object_instance = object_scene.instantiate()
	object_instance.position = grid_position + Vector2(randf_range(-GRID_SIZE/2.0, GRID_SIZE/2.0), randf_range(-GRID_SIZE/2, GRID_SIZE/2))

	add_child(object_instance)

extends Node2D

var tilemap: TileMap
var building_scene: PackedScene
var selected_building: int = 1

var grid_size: int = 16
var is_building_mode: bool = true

func _ready():
	tilemap = $TileMap
	building_scene = preload("res://modules/builder_system/components/ConveyorBelt.tscn")

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if is_building_mode:
				# Obtém a posição do mouse no TileMap
				var mouse_pos = tilemap.local_to_map(get_global_mouse_position())

				# Verifica se a célula está vazia antes de instanciar o objeto
				if not isCellOccupied(mouse_pos):
					instantiateBuilding(mouse_pos)
			else:
				# Seleciona a construção na célula do mouse
				selectBuilding(tilemap.local_to_map(get_global_mouse_position()))

func isCellOccupied(cell: Vector2) -> bool:
	var tile_id = tilemap.get_cell_tile_data(0, cell)
	print(tile_id)
	return false
	return tile_id != -1

func instantiateBuilding(cell: Vector2):
	# Calcula a posição no mundo com base na célula
	@warning_ignore("integer_division")
	var world_pos = tilemap.map_to_local(cell)

	# Instancia o objeto da construção na posição calculada
	var building = building_scene.instantiate()
	building.position = world_pos
	add_child(building)

func selectBuilding(cell: Vector2):
	# Obtém o ID do tile na célula selecionada
	selected_building = tilemap.get_cellv(cell)

func toggleBuildingMode():
	is_building_mode = not is_building_mode
	if is_building_mode:
		print("Modo de construção ativado")
	else:
		print("Modo de construção desativado")

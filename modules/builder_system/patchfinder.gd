extends Node
class_name PatchFinder

func findConnections(matrix, x, y):
	var connections = []
	
	# Verifica se há conexões nas direções adjacentes
	if x > 0 and matrix[y][x - 1] == 1:
		connections.append(Vector2(-1, 0))
	if x < matrix[y].size() - 1 and matrix[y][x + 1] == 1:
		connections.append(Vector2(1, 0))
	if y > 0 and matrix[y - 1][x] == 1:
		connections.append(Vector2(0, -1))
	if y < matrix.size() - 1 and matrix[y + 1][x] == 1:
		connections.append(Vector2(0, 1))
	
	return connections

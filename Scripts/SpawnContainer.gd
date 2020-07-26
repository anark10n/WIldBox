extends Node2D


export (PackedScene) var Enemy

onready var spawn_locations = $Locations.get_children()
onready var enemy_container = get_tree().root.find_node("EnemyContainer", true, false)

func _ready():
	var zombie = Enemy.instance()
	randomize()
	var spawn_point = spawn_locations[randi() % spawn_locations.size() - 1]
	enemy_container.add_child(zombie)
	zombie.global_position = spawn_point.global_position


func _on_Timer_timeout():
	if GameState.enemies_killed > 0:
		for i in GameState.enemies_killed:
			randomize()
			var spawn_point = spawn_locations[randi() % spawn_locations.size() - 1]
			var zombie = Enemy.instance()
			enemy_container.add_child(zombie)
			zombie.global_position = spawn_point.global_position
	else:
		randomize()
		var spawn_point = spawn_locations[randi() % spawn_locations.size() - 1]
		var zombie = Enemy.instance()
		enemy_container.add_child(zombie)
		zombie.global_position = spawn_point.global_position

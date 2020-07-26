extends Node2D


onready var bullet_container = $BulletContainer
onready var player = $Player
onready var enemy = $EnemyContainer


func _ready():
	player.connect("shot_fired", bullet_container, "bullet_spawned")
	enemy.connect("enemy_killed", player, "switch_position")

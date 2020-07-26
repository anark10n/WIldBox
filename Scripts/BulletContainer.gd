extends Node2D


func bullet_spawned(bullet, bullet_position, direction):
	add_child(bullet)
	bullet.global_position = bullet_position
	bullet.set_direction(direction)

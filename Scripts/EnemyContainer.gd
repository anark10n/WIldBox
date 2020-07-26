extends Node2D


signal enemy_killed(kill_position)


func log_death(enemy_position):
	emit_signal("enemy_killed", enemy_position)

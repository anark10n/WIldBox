extends Node


const MAX_SPEED = 20


static func follow(
		velocity,
		global_position,
		target_position,
		max_speed = MAX_SPEED
	) -> Vector2:
	var target_velocity = (target_position - global_position).normalized() * max_speed
	var steering = target_velocity - velocity
	return velocity + steering

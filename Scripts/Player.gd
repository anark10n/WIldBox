extends KinematicBody2D
class_name Player


signal shot_fired(bullet, bullet_position, direction)


export (PackedScene) var Bullet


onready var gun_barrel = $Barrel
onready var gun_direction = $BarrelDirection
onready var player_stat = $Health


const SPEED = 50
const MAX_SPEED = 180
const FRICTION = 0.1


var motion = Vector2()


func _physics_process(delta):
	update_motion()
	move_and_slide(motion)

	
func update_motion():
	look_at(get_global_mouse_position())
	if Input.is_action_pressed("move_up") and not Input.is_action_pressed("move_down"):
		motion.y = clamp(motion.y - SPEED, -MAX_SPEED, 0)
	elif Input.is_action_pressed("move_down") and not Input.is_action_pressed("move_up"):
		motion.y = clamp(motion.y + SPEED, 0, MAX_SPEED)
	else:
		motion.y = lerp(motion.y, 0, FRICTION)

	
	if Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
		motion.x = clamp(motion.x - SPEED, -MAX_SPEED, 0)
	elif Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
		motion.x = clamp(motion.x + SPEED, 0, MAX_SPEED)
	else:
		motion.x = lerp(motion.x, 0, FRICTION)


func _unhandled_input(event):
	if event.is_action_pressed("attack"):
		shoot()


func shoot():
	if Bullet != null:
		var bullet_instance = Bullet.instance()
		var bullet_direction = (gun_direction.global_position - gun_barrel.global_position).normalized()
		emit_signal("shot_fired", bullet_instance, gun_barrel.global_position, bullet_direction)


func handle_hit():
	player_stat.health -= 1
	if player_stat.health > 0:
		print("Damage taken!", player_stat.health)
	else:
		print("You's dead ...")
		queue_free()

func switch_position(enemy_position):
	print("killed one")
	global_position = enemy_position

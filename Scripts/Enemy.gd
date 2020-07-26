extends KinematicBody2D


signal report_dead(enemy_position)
signal update_score


onready var enemy_stat = $Health
onready var enemy_container = get_node("..")
onready var player = get_node("/root/Main/Player")
onready var score = get_tree().root.find_node("GUI", true, false)


export var MAX_SPEED = 65
export var SPEED = 10

var motion = Vector2.ZERO


func _ready():
	if enemy_container != null:
		self.connect("report_dead", enemy_container, "log_death")
	
	if score != null:
		self.connect("update_score", score, "update_score")

func _physics_process(delta):
	var target = player.global_position
	
	motion = Steering.follow(motion, global_position, target, MAX_SPEED)
	
	move_and_slide(motion)
	rotation = motion.angle()


func handle_hit():
	enemy_stat.health -= 1
	if enemy_stat.health > 0:
		print("Damage taken!", enemy_stat.health)
	else:
		print("You's dead ...")
		emit_signal("report_dead", global_position)
		emit_signal("update_score")
		queue_free()

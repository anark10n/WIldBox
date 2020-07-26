extends Area2D
class_name Bullet


const SPEED = 35


onready var life_timer = $BulletLife


var direction = Vector2()

func _ready():
	life_timer.start()


func _physics_process(delta):
	if direction != Vector2.ZERO:
		var velocity = direction * SPEED
		global_position += velocity


func set_direction(direction):
	self.direction = direction
	rotation += direction.angle()


func _on_BulletLife_timeout():
	queue_free()


func _on_Bullet_body_entered(body):
	if body.has_method("handle_hit"):
		body.handle_hit()
	queue_free()

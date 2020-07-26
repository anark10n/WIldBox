extends CanvasLayer

func _ready():
	$Control/TextureRect/CenterContainer/Score.text = str(GameState.enemies_killed)

func update_score():
	GameState.enemies_killed += 1
	$Control/TextureRect/CenterContainer/Score.text = str(GameState.enemies_killed)
	

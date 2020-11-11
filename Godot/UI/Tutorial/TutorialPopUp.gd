extends NinePatchRect

onready var animationPlayer = $AnimationPlayer

func _ready():
	if Stats.tutorial_show == "Right":
		animationPlayer.play("MovementRight")
	elif Stats.tutorial_show == "Left":
		animationPlayer.play("MovementLeft")
	elif Stats.tutorial_show == "Up":
		animationPlayer.play("MovementUp")
	elif Stats.tutorial_show == "Down":
		animationPlayer.play("MovementDown")
	elif Stats.tutorial_show == "ChangeCharacter":
		animationPlayer.play("ChangeCharacter")
	elif Stats.tutorial_show == "AttackEnemy":
		animationPlayer.play("AttackEnemy")
	elif Stats.tutorial_show == "BackToSpirit":
		animationPlayer.play("BackToSpirit")

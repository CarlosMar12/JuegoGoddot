extends KinematicBody2D

const moveSpeed = 30
const maxSpeed = 70

const jumpHeight = -320
const up = Vector2(0,-1)
const gravity = 15
onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer

var motion = Vector2()
var lifes = 5

func _physics_process(delta):
	
	motion.y +=gravity
	var friction=false
	
	if Input.is_action_pressed("ui_right"):
	   sprite.flip_h = true
	   animationPlayer.play("Walk")
	   motion.x = min(motion.x + moveSpeed, maxSpeed)
	
	elif Input.is_action_pressed("ui_left"):		
		 sprite.flip_h = false
		 animationPlayer.play("Walk")
		 motion.x = max(motion.x - moveSpeed, -maxSpeed)
		
	else:
		animationPlayer.play("Idle")
		friction = true
		
	if is_on_floor():
		if Input.is_action_pressed("ui_accept"):
			motion.y = jumpHeight
		if friction ==true:
			motion.x = lerp(motion.x,0,0.5)
	else:
		if friction ==true:
			motion.x=lerp(motion.x,0,0.01)
		
	motion = move_and_slide(motion,up);
	
	
func addCoin():

	var canvasLayer = get_tree().get_root().find_node("CanvasLayer",true,false)
	
	canvasLayer.handlecoinCollected()



func _on_Pinchos_body_entered(body):
	if body.get_name() == "Player":
		print("Hemos tocado los pinchos")
		get_tree().reload_current_scene()
		
func loseLife(var enemyposx):
	
	if position.x < enemyposx:
		motion.x = -200
		motion.y = -100
		
	if position.x > enemyposx:
		motion.x = 200
		motion.y = -100
	lifes = lifes -1
	print("Perdimos una vida quedan :" + str(lifes) + " vidas")
	
	var canvasLayer = get_tree().get_root().find_node("CanvasLayer",true,false)
	
	canvasLayer.handleHearths(lifes)
	
	if lifes<= 0:
		get_tree().reload_current_scene()

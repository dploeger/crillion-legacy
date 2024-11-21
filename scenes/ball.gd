extends CharacterBody2D

const START_SPEED = 250
const SPEED_X = 250

var motion = Vector2(0,0)
var direction = 45
var speed = START_SPEED
var dir = Vector2(1,-1)

func _physics_process(delta):

	speed += 0.1
	
	var movement_x = Input.get_axis("ui_left", "ui_right")
	
	if movement_x == 0:
		dir.x = 1
		
	motion.x = dir.x * cos(direction * (PI/180)) * movement_x * SPEED_X * delta
	motion.y = dir.y * sin(direction * (PI/180)) * speed * delta
	
	var collide = move_and_collide(motion)
	
	if collide:
		match Vector2(round(collide.get_normal().x), round(collide.get_normal().y)):
			Vector2(0, 1):
				dir.y = 1
			Vector2(1, 0):
				dir.x = move_toward(-1, 0, delta)
			Vector2(0, -1):
				dir.y = -1
			Vector2(-1, 0):
				dir.x = -.5

extends CharacterBody2D

const ROTATION_SPEED = 100
const MOVEMENT_SPEED = 40
const MAX_SPEED = Vector2(15,15)
const BULLET_SPEED = 1000

@export var Bullet : PackedScene
var viewportInfo : Rect2

func _ready():
	viewportInfo = get_viewport().get_visible_rect()

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("a"):
		rotate(-PI/50*delta*ROTATION_SPEED)
	
	if Input.is_action_pressed("d"):
		rotate(PI/50*delta*ROTATION_SPEED)
		
	if Input.is_action_pressed("w"):
		velocity += Vector2(cos(rotation-PI/2), sin(rotation-PI/2)) * delta * MOVEMENT_SPEED
		
	if Input.is_action_pressed("space"):
		var b = Bullet.instantiate()
		owner.add_child(b)
		b.transform = $Marker2D.global_transform
		b.bullet_speed = BULLET_SPEED

	if Input.is_action_pressed("shift"):
		velocity *= 0.95
		print("velocity: ", velocity)

	if position.x > viewportInfo.end.x:
		position.x -= viewportInfo.size.x
		
	if position.x < viewportInfo.position.x:
		position.x += viewportInfo.size.x
		
	if position.y > viewportInfo.end.y:
		position.y -= viewportInfo.size.y
		
	if position.y < viewportInfo.position.y:
		position.y += viewportInfo.size.y
		
	velocity = velocity.clamp(-MAX_SPEED, MAX_SPEED)
	position += velocity * delta * MOVEMENT_SPEED

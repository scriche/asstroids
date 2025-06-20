extends RigidBody2D

const ROTATION_SPEED = 100

@export var Bullet : PackedScene

var viewportInfo : Rect2
var velocity : Vector2 = Vector2.ZERO
var health : int = 100

func _physics_process(delta: float) -> void:

	viewportInfo = get_viewport().get_visible_rect()
	Global.set("playerpos", position)
	$TextureProgressBar.max_value = Stats.getstat("max_health")
	$TextureProgressBar.value = health
	scale = Vector2(Stats.getstat("size"), Stats.getstat("size"))

	if Input.is_action_pressed("a"):
		rotate(-PI/50*delta*ROTATION_SPEED)
	
	if Input.is_action_pressed("d"):
		rotate(PI/50*delta*ROTATION_SPEED)
		
	if Input.is_action_pressed("w"):
		velocity += Vector2(cos(rotation-PI/2), sin(rotation-PI/2)) * Stats.getstat("acceleration") * delta

	if Input.is_action_pressed("space"):
		if $Timer.is_stopped():
			var b = Bullet.instantiate()
			owner.add_child(b)
			b.transform = $Marker2D.global_transform
			b.bullet_speed = Stats.getstat("bullet_speed")
			$Timer.start()

	if Input.is_action_pressed("shift"):
		velocity *= 0.95

	if position.x > Global.viewend.x:
		position.x -= viewportInfo.size.x
		
	if position.x < Global.viewpos.x:
		position.x += viewportInfo.size.x

	if position.y > Global.viewend.y:
		position.y -= viewportInfo.size.y

	if position.y < Global.viewpos.y:
		position.y += viewportInfo.size.y

	var _maxspd = Vector2(Stats.getstat("max_speed"), Stats.getstat("max_speed"))
	velocity = velocity.clamp(-_maxspd, _maxspd)
	position += velocity

func damage(amount: int):
	health += amount - int(Stats.getstat("armor")/2)
	if health <= 0:
			Global.set("lives", Global.lives - 1)
			queue_free()
			return

func _on_area_2d_area_entered(area:Area2D):
	if area.is_in_group("Astroids"):
		damage(-10)
	if area.is_in_group(("Coin")):
		Global.set("scrap", Global.scrap + 1)
		print("hit")
		area.get_parent().queue_free()

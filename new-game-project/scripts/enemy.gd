extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var SPEED = 30
var direction = 1
var wait = 1

signal collision
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += direction * SPEED * delta


func _on_timer_timeout() -> void:
	wait = wait + 1
	if wait <= 1:
		SPEED = 30
	elif wait == 4:
		animated_sprite_2d.flip_h = !animated_sprite_2d.flip_h
		wait = 1
		SPEED = 30
		animated_sprite_2d.animation = "Run"
	else:
		animated_sprite_2d.animation = "Idle"
		SPEED = 0
	direction *= -1

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player character":
		emit_signal("collision", body)

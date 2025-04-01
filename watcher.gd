extends CharacterBody2D

# Other Nodes
@onready var watcherSprite = $WatcherSprite
@onready var hitBox = $CollisionShape2D

# Variables
var xSpeed = 300
var ySpeed = 300
var playing = false

func _ready() -> void:
	watcherSprite.animation = "front"
	playing = false

func _process(delta: float) -> void:
	# Animation
	if playing:
		watcherSprite.play()
	else:
		watcherSprite.stop()
		watcherSprite.frame = 0  # Reset to first frame when idle
	
func _physics_process(delta: float) -> void:
	playing = false  # Reset playing status every frame
	velocity = Vector2.ZERO  # Reset velocity every frame
	
	# Movement
	if Input.is_action_pressed("ui_up"):
		playing = true
		velocity.y = -ySpeed
		watcherSprite.animation = "back"
	elif Input.is_action_pressed("ui_down"):
		playing = true
		velocity.y = ySpeed
		watcherSprite.animation = "front"
	elif Input.is_action_pressed("ui_left"):
		playing = true
		velocity.x = -xSpeed
		watcherSprite.animation = "side"
		watcherSprite.flip_h = true  # Flip sprite to face left
	elif Input.is_action_pressed("ui_right"):
		playing = true
		velocity.x = xSpeed
		watcherSprite.animation = "side"
		watcherSprite.flip_h = false  # Ensure sprite faces right
	
	move_and_slide()

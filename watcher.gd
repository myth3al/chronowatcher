extends CharacterBody2D

# Other Nodes
@onready var watcherSprite = $WatcherSprite
@onready var hitBox = $CollisionShape2D

# Vairables
var xSpeed = 300
var ySpeed = 300
var playing

func _ready() -> void:
	watcherSprite.animation = "front"
	playing = false

func _process(delta: float) -> void:
	#Animation
	if playing:
		watcherSprite.play()
	
func _physics_process(delta: float) -> void:
	
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
		print("Sup")
		playing = true
		velocity.x = -xSpeed
		watcherSprite.flip_h()
		watcherSprite.animation = "side"
	elif Input.is_action_pressed("ui_right"):
		playing = true
		velocity.x = xSpeed
		watcherSprite.animation = "side"
	else:
		velocity = Vector2.ZERO
		
	move_and_slide()

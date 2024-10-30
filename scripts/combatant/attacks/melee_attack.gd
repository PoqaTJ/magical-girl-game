extends CollisionShape2D

@export var duration: float = 0.1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start(duration)
	$Timer.timeout.connect(on_timer_end)
	
func on_timer_end() -> void:
	queue_free()

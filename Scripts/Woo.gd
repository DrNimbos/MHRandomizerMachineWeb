extends RichTextLabel

# Duration in seconds for the entire text to reveal
@export var type_speed: float = 1.5 

var typing_tween: Tween
var last_visible := 0

@onready var timer := Timer.new()
@onready var speech: AnimatedSprite2D = $"../speech"
@onready var talk: AudioStreamPlayer = $"../../Talk"


func _ready():
	timer.one_shot = true
	add_child(timer)
	timer.timeout.connect(limpar)
	
func _process(_delta):
	if visible_characters != last_visible:
		last_visible = visible_characters

		# Evita tocar quando termina
		if visible_characters > 0 and visible_ratio < 1.0:
			talk.play()

func start_typing_effect(new_text: String):
	speech.show()
	speech.play("1")
	if typing_tween:
		typing_tween.kill()
	
	timer.stop()
	text = new_text
	visible_ratio = 0.0
	last_visible = 0
	typing_tween = create_tween()
	typing_tween.tween_property(self, "visible_ratio", 1.0, type_speed)

	timer.start(10)

func limpar():
	speech.hide()
	speech.stop()
	text = ""

extends RichTextLabel

@onready var timer = $Timer

var text_queue = []
var is_typing = false

func _ready():
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))

func queue_text(new_text: String):
	text_queue.append(new_text)
	if not is_typing:
		_load_next_text()

func _load_next_text():
	if text_queue.is_empty():
		is_typing = false
		return
		
	is_typing = true
	text = text_queue.pop_front()
	visible_characters = 0
	timer.start()

func _on_timer_timeout():
	if visible_characters < get_total_character_count():
		visible_characters += 1
	else:
		timer.stop()

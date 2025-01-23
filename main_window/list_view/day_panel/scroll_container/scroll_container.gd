extends ScrollContainer

signal scrolled
signal auto_scrolled

const TODO_ITEM_HEIGHT := 40 # pixels


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			_scroll_one_item_down()
			accept_event()
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP:
			_scroll_one_item_up()
			accept_event()

		if vertical_scroll_mode == SCROLL_MODE_SHOW_NEVER:
			if event.button_index == MOUSE_BUTTON_WHEEL_RIGHT:
				_scroll_one_item_down()
				accept_event()
			elif event.button_index == MOUSE_BUTTON_WHEEL_LEFT:
				_scroll_one_item_up()
				accept_event()


func _scroll_one_item_down(emit_scrolled_signal := true) -> void:
	var previous_value := scroll_vertical
	scroll_vertical += TODO_ITEM_HEIGHT
	if emit_scrolled_signal:
		if scroll_vertical != previous_value:
			scrolled.emit.call_deferred()


func _scroll_one_item_up(emit_scrolled_signal := true) -> void:
	var previous_value := scroll_vertical
	scroll_vertical -= TODO_ITEM_HEIGHT
	if emit_scrolled_signal:
		if scroll_vertical != previous_value:
			scrolled.emit.call_deferred()


func _set(property: StringName, value: Variant) -> bool:
	if property == "scroll_vertical":
		if scroll_vertical != value:
			scroll_vertical = value
			auto_scrolled.emit.call_deferred()
		return true

	return false

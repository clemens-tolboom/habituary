extends VBoxContainer

const INPUT_HINT_SCENE := preload("input_hint/main.tscn")

var descriptions := {
	"view_mode_1": "Change View To Show 1 Day",
	"view_mode_2": "Change View To Show 3 Days",
	"view_mode_3": "Change View To Show 5 Days",
	"view_mode_4": "Change View To Show 7 Days",

	"shift_view_backward": "Shift 1 View Backward",
	"previous_day": "Shift 1 Day Backward",
	"jump_to_today": "Jump To Today",
	"next_day": "Shift 1 Day Forward",
	"shift_view_forward": "Shift 1 View Forward",

	"toggle_calendar_widget": "Open/Close Calendar Widget",
	"search_screen": "Search To-Dos On Screen",
	"show_help": "Open/Close Help Panel",
	"show_bookmarks": "Open/Close Bookmarks Panel",
	"show_capture": "Open/Close Capture Panel",
	"show_settings": "Open/Close Settings Panel",
	"toggle_fullscreen": "Toggle Fullscreen On/Off",
	"toggle_dark_mode": "Toggle Dark Mode On/Off",

	"toggle_todo": "Toggle Done State",
	"cancel_todo": "Toggle Canceled State",
	"indent_todo": "Indent To-Do",
	"unindent_todo": "Unindent To-Do",
	"toggle_heading": "Set/Unset As Foldable Heading",
	"toggle_bold": "Add/Remove Bold Formatting",
	"toggle_italic": "Add/Remove Italic Formatting",
	"toggle_bookmark": "Add/Remove Bookmark",
	"next_text_color": "Switch To Next Text Color",
	"previous_text_color": "Switch To Previous Text Color",
	"delete_todo": "Delete To-Do",
	"previous_todo": "Select Previous To-Do",
	"next_todo": "Select Next To-Do",
	"move_todo_up": "Move To-Do Up",
	"move_todo_down": "Move To-Do Down",
}


func _ready() -> void:
	_connect_signals()

	var app_version : String = ProjectSettings.get("application/config/version")
	if app_version:
		%Version/ID.text = app_version
	else:
		%Version.queue_free()

	for action in [
		"view_mode_1",
		"view_mode_2",
		"view_mode_3",
		"view_mode_4",
	]:
		var hint = INPUT_HINT_SCENE.instantiate()
		hint.description = descriptions[action]
		hint.key_binding = InputMap.action_get_events(action)[0]
		%KeyBindingsBlock1.add_child(hint)

	for action in [
		"shift_view_backward",
		"previous_day",
		"jump_to_today",
		"next_day",
		"shift_view_forward",
	]:
		var hint = INPUT_HINT_SCENE.instantiate()
		hint.description = descriptions[action]
		hint.key_binding = InputMap.action_get_events(action)[0]
		%KeyBindingsBlock2.add_child(hint)

	for action in [
		"search_screen",
	]:
		var hint = INPUT_HINT_SCENE.instantiate()
		hint.description = descriptions[action]
		hint.key_binding = InputMap.action_get_events(action)[0]
		%KeyBindingsBlock3.add_child(hint)

	for action in [
		"toggle_calendar_widget",
		"show_help",
		"show_bookmarks",
		"show_capture",
		"show_settings",
		"toggle_fullscreen",
		"toggle_dark_mode",
	]:
		var hint = INPUT_HINT_SCENE.instantiate()
		hint.description = descriptions[action]
		hint.key_binding = InputMap.action_get_events(action)[0]
		%KeyBindingsBlock4.add_child(hint)

	for action in [
		"toggle_todo",
		"cancel_todo",
		"indent_todo",
		"unindent_todo",
		"toggle_heading",
		"toggle_bold",
		"toggle_italic",
		"next_text_color",
		"previous_text_color",
		"toggle_bookmark",
		"delete_todo",
		"previous_todo",
		"next_todo",
		"move_todo_up",
		"move_todo_down",
	]:
		var hint = INPUT_HINT_SCENE.instantiate()
		hint.description = descriptions[action]
		hint.key_binding = InputMap.action_get_events(action)[0]
		%KeyBindingsBlock5.add_child(hint)


func _connect_signals() -> void:
	#region Local Signals
	%ReportIssue.meta_clicked.connect(_on_report_issue_meta_clicked)
	#endregion


func _on_report_issue_meta_clicked(_meta: Variant) -> void:
	OS.shell_open("https://github.com/njamster/habituary/issues")

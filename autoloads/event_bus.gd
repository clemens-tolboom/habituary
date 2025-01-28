extends Node

# FIXME: currently there is no @warning_ignore_all annotation, see:
# https://github.com/godotengine/godot-proposals/issues/5906

@warning_ignore("unused_signal")
signal today_changed
@warning_ignore("unused_signal")
signal dark_mode_changed(dark_mode)
@warning_ignore("unused_signal")
signal view_mode_changed(view_mode)
@warning_ignore("unused_signal")
signal current_day_changed(current_day)
@warning_ignore("unused_signal")
signal day_start_changed()
@warning_ignore("unused_signal")
signal show_bookmarks_from_the_past_changed
@warning_ignore("unused_signal")
signal fade_ticked_off_todos_changed
@warning_ignore("unused_signal")
signal fade_non_today_dates_changed
@warning_ignore("unused_signal")
signal to_do_text_colors_changed

@warning_ignore("unused_signal")
signal calendar_button_pressed
@warning_ignore("unused_signal")
signal search_screen_button_pressed

@warning_ignore("unused_signal")
signal overlay_closed
@warning_ignore("unused_signal")
signal side_panel_changed()

@warning_ignore("unused_signal")
signal todo_list_clicked
@warning_ignore("unused_signal")
signal search_query_changed

@warning_ignore("unused_signal")
signal bookmark_added(to_do)
@warning_ignore("unused_signal")
signal bookmark_changed(to_do, old_date, old_index)
@warning_ignore("unused_signal")
signal bookmark_removed(to_do)
@warning_ignore("unused_signal")
signal bookmark_jump_requested(date, line_number)
@warning_ignore("unused_signal")
signal bookmarks_due_today_changed

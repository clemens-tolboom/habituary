extends PanelContainer


func _ready() -> void:
	_connect_signals()

	self.hide()

	for panel in [$Settings, $Capture, $Bookmarks, $Help]:
		panel.hide()


func _connect_signals() -> void:
	EventBus.side_panel_changed.connect(_on_side_panel_changed)
	_on_side_panel_changed()


func _on_side_panel_changed() -> void:
	match Settings.side_panel:
		Settings.SidePanelState.HIDDEN:
			_toggle_panel(self)
			self.hide()
		Settings.SidePanelState.SETTINGS:
			_toggle_panel($Settings)
		Settings.SidePanelState.CAPTURE:
			_toggle_panel($Capture)
		Settings.SidePanelState.BOOKMARKS:
			_toggle_panel($Bookmarks)
		Settings.SidePanelState.HELP:
			_toggle_panel($Help)


func _toggle_panel(target : Control) -> void:
	for panel in [$Settings, $Capture, $Bookmarks, $Help]:
		if panel == target:
			panel.visible = not panel.visible
			if panel.visible:
				self.show()
			else:
				self.hide()
		else:
			panel.hide()

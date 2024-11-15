extends Node

# Dictionary to store game state data
var data: Dictionary = {'player':{}, 'crops':{}, 'inventory':{}}

# File path for saving and loading
const SAVE_FILE_PATH: String = "user://savegame.save"

# Auto-save interval in seconds
const AUTO_SAVE_INTERVAL: float = 60.0  # Save every 60 seconds


func _ready() -> void:
    # Start the auto-save timer
    start_auto_save_timer()
    # Attempt to load existing game data
    load_game()


func save_game() -> void:
    var file = FileAccess.open(SAVE_FILE_PATH, FileAccess.WRITE_READ)
    if file:
        var json_data = JSON.stringify(data)
        file.store_string(json_data)
        file.close()
        print("Game saved successfully.")
    else:
        print("Failed to save game.")


func load_game() -> void:
    var file = FileAccess.open(SAVE_FILE_PATH, FileAccess.READ)
    if file:
        var json = JSON.new()
        var json_data = file.get_as_text()
        var error = json.parse(json_data)
        if error == OK:
            data = JSON.parse_string(json_data)
            print("Game loaded successfully.")
        else:
            print("Error parsing save file: ", error,)
        file.close()
    else:
        print("No save file found. Starting new game.")


func start_auto_save_timer() -> void:
    var timer = Timer.new()
    timer.wait_time = AUTO_SAVE_INTERVAL
    timer.autostart = true
    timer.timeout.connect(_on_auto_save_timeout)
    add_child(timer)


func _on_auto_save_timeout() -> void:
    save_game()


func _notification(what):
    if what == NOTIFICATION_WM_CLOSE_REQUEST:
        # Defer the save to ensure other nodes have saved their state
        call_deferred("save_game")
        # Allow the application to quit
        get_tree().quit()

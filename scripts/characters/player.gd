extends CharacterBody2D


@export var speed = 250  # Movement speed in pixels per second
@onready var crop_manager = get_node("/root/CropManager")
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var selected_crop: String = "carrot"  # Default crop
var looking_direction = "down"

signal interact
signal interact2


func _ready() -> void:
    # Add the player to the "Player" group for identification
    load_state()


func _input(event: InputEvent) -> void:
    # Check if the interaction key is pressed
    if event.is_action_pressed("interact"):
        interact.emit()
        
    if event.is_action_pressed("interact2"):
        interact2.emit()


func set_selected_crop(crop_name: String) -> void:
    selected_crop = crop_name


func _physics_process(delta: float) -> void:
    var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
    velocity = direction * speed

    if direction.x > 0:
        looking_direction = "right"
    elif direction.x < 0:
        looking_direction = "left"
    elif direction.y > 0:
        looking_direction = "down"
    elif direction.y < 0:
        looking_direction = "up"

    update_animation(direction)
    move_and_slide()


func update_animation(direction: Vector2):
    var animation_type = "walk" if direction.length() > 0 else "idle"
    var animation_name = animation_type + "_" + looking_direction
    sprite.play(animation_name)


## SAVE FUNCTIONS
func save_state() -> void:
    # Save player's position
    SaveData.data["player"]['pos_x'] = global_position.x
    SaveData.data["player"]['pos_y'] = global_position.y


func load_state() -> void:
    # Load player's position
    print(SaveData.data.values()[1])
    if 'pos_x' in SaveData.data['player'] || 'pos_y' in SaveData.data['player']:
        print("Player position loaded.")
        global_position = Vector2(
            SaveData.data["player"]['pos_x'],
            SaveData.data["player"]['pos_y']
        )


func _notification(what):
    if what == NOTIFICATION_WM_CLOSE_REQUEST:
        # Save player state before the game quits
        save_state()

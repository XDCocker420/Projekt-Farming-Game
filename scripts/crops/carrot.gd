extends AnimatedSprite2D


@onready var timer: Timer = $Timer
@onready var player: CharacterBody2D = get_tree().get_nodes_in_group("Player")[0]
@onready var field: Area2D = get_parent()

var state = 0


func _ready() -> void:
    timer.wait_time = CropManager.get_crop_time('carrot')
    player.interact.connect(_on_player_interact)
    play("grow 1")
    timer.start()


func _on_timer_timeout() -> void:
    if state != 2:
        state += 1
        timer.start()
        
    if state == 1:
        position.y -= 10
        play("grow 2")
    elif state == 2:
        play("grow 3")


func _on_player_interact():
    if state == 2 and field.player_in_area == true:
        add_inventory()
        queue_free()


func save_crop() -> void:
    # save crops growth stage and time left on timer
    SaveData.data['crops']['carrot']["time_left"] = timer.time_left
    SaveData.data['crops']['carrot']["growth_stage"] = state


func add_inventory() -> void:
    if 'carrot' in SaveData.data['inventory']:
        SaveData.data['inventory']['carrot'] += 2
    else:
        SaveData.data['inventory']['carrot'] = 1

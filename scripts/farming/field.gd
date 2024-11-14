extends Area2D


var player_in_area: bool = false
var crop:Node

@onready var player: CharacterBody2D = get_tree().get_nodes_in_group("Player")[0]
@onready var carrot_scene = preload("res://scenes/crops/carrot.tscn")


func _ready() -> void:
    body_entered.connect(_on_body_entered)
    body_exited.connect(_on_body_exited)
    player.interact.connect(_on_player_interact)
    

func _on_body_entered(body: Node) -> void:
    if body.is_in_group("Player"):
        player_in_area = true


func _on_body_exited(body: Node) -> void:
    if body.is_in_group("Player"):
        player_in_area = false


func _on_player_interact() -> void:
    if player_in_area:
        plant()


func plant() -> void:
    if not get_node_or_null("Carrot"):
        crop = carrot_scene.instantiate()
        add_child(crop)
        #SaveData.data['inventory']['carrot'] -= 1
    #else:
            #crop.queue_free()






















# signal crop_planted(crop_type)
# signal crop_harvested(crop_data)

# var current_crop: CropData = null
# var is_occupied: bool = false
# var player_in_range: bool = false

# @onready var sprite: Sprite2D = $Sprite2D
# @onready var crop_manager = get_node("/root/CropManager")
# @export var spawn_carrot = load("res://scenes/structures/carrot.tscn")

# func _ready():
#     body_entered.connect(_on_body_entered)
#     body_exited.connect(_on_body_exited)

# func _on_body_entered(body: Node2D) -> void:
#     if body.is_in_group("Player"):
#         player_in_range = true
#         player_entered.emit(self)
#         print("Player entered field: ", name)

# func _on_body_exited(body: Node2D) -> void:
#     if body.is_in_group("Player"):
#         player_in_range = false
#         player_exited.emit(self)
#         print("Player exited field: ", name)

# func try_interact(selected_crop: String = "carrot") -> void:
#     if player_in_range:
#         if is_occupied and is_fully_grown():
#             harvest_crop()
#         else:
#             plant_new_crop(selected_crop)

# func plant_new_crop(crop_name: String) -> bool:
#     if not can_plant():
#         print("Cannot plant here")
#         return false
        
#     var crop = crop_manager.get_crop_type(crop_name)
#     if not crop:
#         print("Invalid crop type: ", crop_name)
#         return false
        
#     #current_crop = CropData.new()
#     #current_crop.crop_type = crop
#     #current_crop.growth_progress = 0.0
#     #current_crop.current_stage = 0
#     #current_crop.plant_time = Time.get_unix_time_from_system()
#     #is_occupied = true
#     #update_crop_appearance()
#     #crop_planted.emit(crop_name)
#     spawn()
#     print("Planted: ", crop_name)
#     return true

# func harvest_crop() -> void:
#     if is_occupied and is_fully_grown():
#         var harvested_crop = current_crop
#         current_crop = null
#         is_occupied = false
#         sprite.texture = null
#         crop_harvested.emit(harvested_crop)
#         print("Crop harvested!")

# func can_plant() -> bool:
#     return not is_occupied

# func is_fully_grown() -> bool:
#     if current_crop:
#         return current_crop.growth_progress >= 1.0
#     return false


# func spawn() -> void:
#     var carrot = spawn_carrot.instantiate()
#     global_position = get_global_mouse_position()
#     #add_child(carrot)
#     add_sibling(carrot)

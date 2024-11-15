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

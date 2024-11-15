extends TileMapLayer


@onready var e_button: AnimatedSprite2D = $AnimatedSprite2D3
@onready var door: AnimatedSprite2D = $AnimatedSprite2D
@onready var player: CharacterBody2D = %Player

var in_area = false
var open = false


func _ready() -> void:
	e_button.visible = false
	player.interact.connect(_on_player_interact)


func _on_player_interact():
	if in_area:
		if not open:
			door.play("open")
			open = true
		else:
			door.play_backwards("open")
			open = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		e_button.visible = true
		in_area = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		e_button.visible = false
		in_area = false
		
		if open:
			door.play_backwards("open")
			open = false

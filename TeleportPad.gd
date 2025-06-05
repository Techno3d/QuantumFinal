extends Node3D

@export var teleportDestination : PackedScene
@onready var collider : Area3D = $"Collider"

func _ready():
	collider.body_entered.connect(playerEntered)
	
func playerEntered(body: Node3D):
	if body.is_in_group("Player"):
		print("AHHH")
		get_tree().change_scene_to_packed(teleportDestination)

extends Node3D

@onready var teleportDestination : PackedScene
@onready var collider : Area3D = $"Collider"

func _ready():
	collider.area_entered.connect(playerEntered())
	
func playerEntered():
	var array : Array[Node3D] = collider.get_overlapping_bodies()
	for node in array:
		if node.is_in_group("Player"):
			get_tree().change_scene_to_packed(teleportDestination)

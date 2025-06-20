extends Node3D

@onready var area: Area3D = $Area3D
@onready var text_PW: MeshInstance3D = $TextBackgroundPW

func _ready():
    area.body_entered.connect(func(x):
        if x.is_in_group("Player"):
            text_PW.show()
    )
    area.body_exited.connect(func(x):
        if x.is_in_group("Player"):
            text_PW.hide()
    )
    text_PW.hide()

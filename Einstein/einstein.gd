extends Node3D

@onready var area: Area3D = $Area3D
@onready var text_CH: MeshInstance3D = $TextBackgroundCH
@onready var text_PW: MeshInstance3D = $TextBackgroundPW

func _ready():
    text_CH.hide()
    text_PW.hide()
    area.body_entered.connect(func():
        text_CH.show()
        text_PW.show()
    )
    area.body_exited.connect(func():
        text_CH.hide()
        text_PW.hide()
    )

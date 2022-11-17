extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Metodos custom
# Para que el Area2D reconozca el daño de los proyectiles 
# (el nodo raíz es Node2D y nosotros necesitamos el Area2D)
func recibir_danio(danio: float) -> void:
	owner.recibir_danio(danio)

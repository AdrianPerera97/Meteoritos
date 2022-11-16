##class_name EnemigoDummy 
extends Node2D

#var hitpoints:float = 10.0

# Señales internas
func _on_Area2D_body_entered(body: Node) -> void:
	if body is Player:
		body.destruir()

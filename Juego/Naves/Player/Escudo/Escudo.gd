class_name Escudo extends Area2D

## Variables export
export var energia:float = 8.0
export var radio_desgaste:float = -1.6

## Variables
var esta_activado:bool = false setget ,get_esta_activado # <---- ??????????
var energia_original:float 

## Variables onready
onready var colisionador:CollisionShape2D = $CollisionShape2D
onready var animacion:AnimationPlayer = $AnimationPlayer

# Setters y getters
func get_esta_activado() -> bool:
	return esta_activado

# Metodos
func _process(delta: float) -> void:
	controlar_energia(radio_desgaste * delta)

func _ready():
	energia_original = energia
	
	set_process(false)
	controlar_colisionador(true)

# Metodos custom
func controlar_energia(consumo: float) -> void:
	energia += consumo
	###debug
	print("Energia del escudo: ", energia)

	if energia > energia_original:
		energia = energia_original
	elif energia <= 0.0:
		desactivar()
	
func controlar_colisionador(esta_desactivado:bool) -> void:
	colisionador.set_deferred("disabled", esta_desactivado)

func activar() -> void:
	if energia <= 0.0:
		return
	
	esta_activado = true
	controlar_colisionador(false)
	animacion.play("activando")

func desactivar() -> void:
	set_process(false)
	esta_activado = false
	controlar_colisionador(true)
	animacion.play_backwards("activando")

#Señales internas
func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if (anim_name == "activando" and esta_activado):
		animacion.play("activado")
		set_process(true)

func _on_body_entered(body : Node) -> void:
	body.queue_free()

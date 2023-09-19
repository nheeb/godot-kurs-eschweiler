extends Node2D

@export var relative_target: Vector2 = Vector2(100.0, 0.0)
@export var speed: float = 100.0

var travel_distance: float
var travel_direction: Vector2
var time: float = 0.0
str()

# Wird aufgerufen, wenn die Szene geladen wird
func _ready():
	# Die Position 'relative_target' wird in Richtung und Entfernung zerlegt
	travel_distance = relative_target.length()
	travel_direction = relative_target.normalized()

# Wird jeden Frame aufgerufen. 'delta' ist Zeit seit dem letzten Frame.
func _process(delta):
	# Variable für die Zeit aktualisieren
	time = time + delta
	
	# PlatformBody mittels der 'pingpong' Funktion bewegen
	$PlatformBody.position = travel_direction * pingpong(time * speed, travel_distance)



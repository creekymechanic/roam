@icon("gdticon.png")
extends Resource
class_name PlayerParameters

@export_group("Configuration")
@export var AUTOHOP : bool = false ## Tells the character to check for the jump action being held instead of pressed, which will make all jumps perfect bunny hops.

@export_group("Engine Dependant Variables")
@export var FORWARD_SPEED : float = 8.128 ## Forward and backward move speed. The default value equals 8.128 (or 320 Hammer units/inches).
@export var SIDE_SPEED : float = 8.128 ## Left and right move speed. The default value equals 8.128 (or 320 Hammer units/inches).
@export var MAX_AIR_SPEED : float = 0.762 ## The maximum speed you can accelerate to in the [method _airaccelerate] function. The default value equals 0.762 (or 30 Hammer units/inches).
@export var STOP_SPEED : float = 2.54 ## Speed threshold for stopping in the [method _friction] function. The default value equals 2.540 (or 100 Hammer units/inches).
@export var GRAVITY : float = 20.32 ## Speed of gravity. The default value equals 20.320 (or 800 Hammer units/inches).
@export var JUMP_HEIGHT : float = 1.143 ## Height of the player's jump. The default value equals 1.143 (or 45 Hammer units/inches).

@export_subgroup("Player Dimensions")
@export var HULL_STANDING_BOUNDS : Vector3 = Vector3(0.813, 1.829, 0.813) ## The dimensions of the player's collision hull while standing. The default dimensions are [0.813, 1.829, 0.813] (or [32, 72, 32] in Hammer units/inches).
@export var HULL_DUCKING_BOUNDS : Vector3 = Vector3(0.813, 0.914, 0.813) ## The dimensions of the player's collision hull while ducking. The default dimensions are [0.813, 0.914, 0.813] (or [32, 36, 32] in Hammer units/inches).
@export var VIEW_OFFSET : float = 0.711 ## How much the camera hovers from player origin while standing. The default value equals 0.711 (or 28 Hammer units/inches).
@export var DUCK_VIEW_OFFSET : float = 0.305 ## How much the camera hovers from player origin while crouching. The default value equals 0.305 (or 12 Hammer units/inches).

@export_group("Engine Agnostic Variables")
@export var ACCELERATION : float = 10.0 ## The base acceleration amount that is multiplied by [code]wishspeed[/code] inside of [method _accelerate]. The default value equals 10.
@export var AIR_ACCELERATION : float = 10.0 ## The base acceleration amount that is multiplied by [code]wishspeed[/code] inside of [method _airaccelerate]. The default value equals 10.
@export var FRICTION : float = 4.0 ## The multiplier of dropped speed when friction is acting on the player. The default value equals 4.
@export var DUCKING_SPEED_MULTIPLIER : float = 0.333; ## The multiplier placed on the player's desired input speed while ducking. The default value equals 0.333.

@export_subgroup("Camera")
@export var MOUSE_SENSITIVITY : float = 15.0 ## How fast the camera moves in response to player input. The default value equals 15.
@export var BOB_FREQUENCY : float = 0.008
@export var BOB_FRACTION : float = 12
@export var ROLL_ANGLE : float = 0.65
@export var ROLL_SPEED : float = 300

func _ready():
	GlobalSettings.connect("mouse_sens_updated", _on_mouse_sens_updated)

func _on_mouse_sens_updated(value):
	MOUSE_SENSITIVITY = value

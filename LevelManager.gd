extends Node2D

# 3 planet options from a list

# selecting planet

# loading planet and moddifiers

# create a level sequnce timeline

# add astroids and enemys to timeline

# disable enemys and astroids spawn in boss

# overlay shop with stats mods and health
var planetgenerator : Node2D

signal planet_selection(planetA, planetB, planetC)

func _ready():

    planetgenerator = $PlanetGenerator

func DisplayPlanets():
    # Display 3 boxes with a picture of a planet and a name and below is random planet modifier pulled from a list
    # get 3 random planett name and pictures from a list
    # pick a random modifer and and random multiplier to the modifier each modifer has a value equal to how good it is
    # balance the modifers so that they are equal to 0
    # the first planet should have the least amount of modifers and the last planet should have the most amount of modifers
    
    var planetA = planetgenerator.genPlanet(randi_range(0,1), 1)
    var planetB = planetgenerator.genPlanet(2, 3)
    var planetC = planetgenerator.genPlanet(3, 5)
    emit_signal("planet_selection", planetA, planetB, planetC)

func _on_round_time_timeout():
    # Pause the game
    get_tree().paused = true
    # Show the planet selection UI
    DisplayPlanets()
    
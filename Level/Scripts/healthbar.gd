extends TextureProgressBar

@export var player: Player

func _ready():
	if player.healthChanged.connect(update):
		update()
	
func update():
	print("updated: ",player.currentHealth)
	value = player.currentHealth * 100/player.maxHealth

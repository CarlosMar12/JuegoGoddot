extends CanvasLayer

var coins = 0

var hearth1
var hearth2
var hearth3
var hearth4
var hearth5


func _ready():
	
	hearth1 = get_node("Heart1")
	hearth2 = get_node("Heart2")
	hearth3 = get_node("Heart3")
	hearth4 = get_node("Heart4")
	hearth5 = get_node("Heart5")
	$coinsCollectedText.text = String(coins)

func handlecoinCollected():
	print("Coin Collected")
	coins +=1
	$coinsCollectedText.text = String(coins)
	
	if coins == 5 :
		get_tree().change_scene("res://Scenes/Mundo" + str(int(get_tree().current_scene.name)+1)+".tscn")
		
func handleHearths(var lifes):
	if lifes == 0:
		hearth1.visible = false
	if lifes == 1:
		hearth2.visible = false
	if lifes == 2:
		hearth3.visible = false
	if lifes == 3:
		hearth4.visible = false
	if lifes == 4:
		hearth5.visible = false

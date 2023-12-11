extends Control


func _input(event):
	if event.is_action_pressed("pause"):
		visible = not get_tree().paused
		print("El juego ha sido pausado")
		get_tree().paused = not get_tree().paused

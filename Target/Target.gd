extends StaticBody

func die():
	Global.update_score(25)
	queue_free()

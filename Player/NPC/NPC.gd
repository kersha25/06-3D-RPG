extends KinematicBody

onready var Dialogue = get_node("/root/Game/UI/Dialogue")

var dialogue = [
	"Welcome to the game! (press E to continue)"
	,"Your life depends on your speed and accuracy."
	,"Shoot the four targets before time runs out!"
	,"As soon as you press E the challenge will begin."
]

func _ready():
	$AnimationPlayer.play("Idle")
	Dialogue.connect("finished_dialogue", self, "finished")


func _on_Area_body_entered(body):
	Dialogue.start_dialogue(dialogue)


func _on_Area_body_exited(body):
	Dialogue.hide_dialogue()


func finished():
	get_node("/root/Game/Target_container").show()
	Global.timer = 75
	Global.update_time()
	get_node("/root/Game/UI/Timer").start()

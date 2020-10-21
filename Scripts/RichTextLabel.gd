extends RichTextLabel
var scores = "0"
func _process(delta):
	set_text(scores)

func _on_DuplicateThresh_score(score):
	scores = str(score)
	print(score)

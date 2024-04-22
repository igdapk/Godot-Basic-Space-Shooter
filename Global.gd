extends Node

var player:Node2D
var score_label:Label
var score:int = 0

func incrementScore():
	score += 1
	score_label.text = str(score)

func reset():
	score = 0

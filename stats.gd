extends Node

signal healthChanged(value)
signal setMaxHealth(v)
signal checkpoint(v)

var newGame = 5

var health = 100
var maxHealth = 250

var maxCollectibles = 1
var collected = 0

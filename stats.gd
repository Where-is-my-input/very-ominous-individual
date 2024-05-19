extends Node

signal healthChanged(value)
signal setMaxHealth(v)
signal checkpoint(v)
signal unload(i)
signal load(i)
signal setBoundaries(i)
signal respawn()
signal death()
signal dashCd()
signal jumpCd()
signal dashCollected()
signal gameOver()

var newGame = 0

var health = 100
var maxHealth = 250

var deaths = 0

var maxCollectibles: float = 6
var collected: float = 0
var flDashCollected = false
var flJumpCollected = false

var light1 = true
var light2 = true
var light3 = true
var light4 = true

var showTimer = false
var timed = false
var time: float = 0.0
var hours: int = 0
var minutes: int = 0
var seconds: int = 0
var msec: int = 0

func _process(delta):
	time += delta
	msec = fmod(time, 1) * 100
	seconds = fmod(time, 60)
	minutes = fmod(time, 3600) / 60
	hours = floor(time / 60 / 60 / 60)

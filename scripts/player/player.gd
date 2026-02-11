extends CharacterBody2D

# --- Stats ---
@export var speed := 120
var hp := 100
var max_hp := 100
var mana := 100
var max_mana := 100
var xp := 0
var level := 1

# --- Movement ---
func _physics_process(delta):
	var direction = Vector2.ZERO
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
if Input.is_action_just_pressed("cast_spell"):
	cast_spell()
	
	if direction != Vector2.ZERO:
		velocity = direction.normalized() * speed
		move_and_slide()

# --- Mana System ---
func use_mana(amount:int) -> bool:
	if mana >= amount:
		mana -= amount
		return true
	return false

# --- XP & Level System ---
@export var xp_to_level := 100

func gain_xp(amount:int):
	xp += amount
	while xp >= xp_to_level:
		xp -= xp_to_level
		level_up()

func level_up():
	level += 1
	max_hp += 20
	hp = max_hp
	max_mana += 10
	mana = max_mana
	speed += 5  # optional
	print("Leveled up! Now level: %d" % level)

# --- Example Spell Cast ---
@export var spell_mana_cost := 10

func cast_spell():
	if use_mana(spell_mana_cost):
		print("Spell cast!")
	else:
		print("Not enough mana!")

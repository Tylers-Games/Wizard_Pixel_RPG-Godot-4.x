var max_mana := 100
var mana := 100

func use_mana(amount:int) -> bool:
	if mana >= amount:
		mana -= amount
		return true
	return false

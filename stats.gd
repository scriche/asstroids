extends Node

var _stats := {
	"max_health": _make_stat(100),
    "acceleration": _make_stat(30),
    "max_speed": _make_stat(8),
	"fire_rate": _make_stat(1),
    "bullet_speed": _make_stat(1000),
	"size": _make_stat(1),
	"armor": _make_stat(0),

	"shield": _make_stat(0),
	"shield_recharge": _make_stat(0.5),
	"dodge_chance": _make_stat(0),
	"ability_cooldown": _make_stat(0),
	"bullet_piercing": _make_stat(0),
	"bullet_size": _make_stat(1),
	"bullet_damage": _make_stat(10),
	"bullet_crit_percent": _make_stat(0),
	"bullet_crit_multi": _make_stat(1.5),
	"bullet_potency": _make_stat(1),
	"bullet_power": _make_stat(1),
	"bullet_count": _make_stat(1),
	"riccochet_count": _make_stat(0),
}

func _make_stat(base: float) -> Dictionary:
	return {
		"base": base,
		"flat": [],
		"mult": [],
		"formula": null
	}

# Get the final calculated value of a stat
func getstat(statname: String, ctx := {}) -> float:
	var stat = _stats.get(statname)
	if stat == null:
		push_error("Stat not found: " + statname)
		return 0.0

	if stat["formula"] != null:
		return stat["formula"].call_func(ctx)

	var value = stat["base"]
	for f in stat["flat"]:
		if f != null:
			value += f
	for m in stat["mult"]:
		if m != null:
			value *= m
	return value

# Set the base value of a stat
func setstat(statname: String, base_value: float) -> void:
	if _stats.has(statname):
		_stats[statname]["base"] = base_value
	else:
		push_error("Stat not found: " + statname)

# Add a modifier to a stat and return its index (flat or mult)
func add(statname: String, kind: String, value: float) -> int:
	if !_stats.has(statname):
		push_error("Stat not found: " + statname)
		return -1

	var list = _stats[statname][kind]
	for i in range(list.size()):
		if list[i] == null:
			list[i] = value
			return i

	list.append(value)
	return list.size() - 1

# Remove a modifier from a stat by nulling its index
func remove(statname: String, kind: String, index: int) -> void:
	if !_stats.has(statname):
		push_error("Stat not found: " + statname)
		return

	var list = _stats[statname][kind]
	if index >= 0 and index < list.size():
		list[index] = null

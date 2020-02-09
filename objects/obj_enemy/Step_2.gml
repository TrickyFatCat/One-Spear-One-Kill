event_inherited();

// Spawn drop
if (!item_is_chosen) {
	// Choose item
	var item_id = irandom_range(0, array_length_1d(drop_list) - 1);
	var map = drop_list[item_id];
	// Check chance
	var roll = irandom_range(1, spawn_weight_sum);
	var weight = map[? "drop_weight"];
	if roll <= weight {
		drop_item = map[? "item_id"];
		item_is_chosen = !item_is_chosen;
	}
}
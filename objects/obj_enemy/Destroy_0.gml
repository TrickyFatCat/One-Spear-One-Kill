event_inherited();

// Increase points
global.points += points_add * global.combo;

// Spawn item
if drop_item != noone {
	var drop = instance_create_layer(x, y, "entities", drop_item);
	drop.is_dropping = true;
}
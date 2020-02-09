event_inherited();

scr_set_shadow(true, 0, 2);

// Drop list
drop_list[drop_id.noone] = ds_map_create();
ds_map_add(drop_list[drop_id.noone], "item_id", noone);
ds_map_add(drop_list[drop_id.noone], "drop_weight", 30);

drop_list[drop_id.flask_small] = ds_map_create();
ds_map_add(drop_list[drop_id.flask_small], "item_id", obj_flask_health_small);
ds_map_add(drop_list[drop_id.flask_small], "drop_weight", 30);

drop_list[drop_id.flask_big] = ds_map_create();
ds_map_add(drop_list[drop_id.flask_big], "item_id", obj_flask_health_big);
ds_map_add(drop_list[drop_id.flask_big], "drop_weight", 40);

for (var i = 0; i < array_length_1d(drop_list); i++) {
	var map = drop_list[i];
	var weight = map[? "drop_weight"];
	spawn_weight_sum += weight;
}

// States
enum zombie_state {
	idle,
	move,
	attack,
	death
}

state_current = zombie_state.idle;
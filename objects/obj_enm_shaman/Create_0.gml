event_inherited();

// Drop list
drop_list[drop_id.noone] = ds_map_create();
ds_map_add(drop_list[drop_id.noone], "item_id", noone);
ds_map_add(drop_list[drop_id.noone], "drop_weight", 30);

drop_list[drop_id.flask_small] = ds_map_create();
ds_map_add(drop_list[drop_id.flask_small], "item_id", obj_flask_health_small);
ds_map_add(drop_list[drop_id.flask_small], "drop_weight", 60);

drop_list[drop_id.flask_big] = ds_map_create();
ds_map_add(drop_list[drop_id.flask_big], "item_id", obj_flask_health_big);
ds_map_add(drop_list[drop_id.flask_big], "drop_weight", 10);

for (var i = 0; i < array_length_1d(drop_list); i++) {
	var map = drop_list[i];
	var weight = map[? "drop_weight"];
	spawn_weight_sum += weight;
}

// States
enum shaman_state {
	idle,
	move,
	attack,
	withdraw
}

state_current = shaman_state.idle;

// Timers
counter_cast = 0;
timer_cast = room_speed * 2;

// Magic
projectile = noone;

// Withdraw
withdraw_dir_ready = false;
withdraw_dir = 0;

var dist_delta = shoot_dist * 0.15;
shoot_dist = shoot_dist + random_range(dist_delta * -1, dist_delta);

// Sounds
snd_cast = false;
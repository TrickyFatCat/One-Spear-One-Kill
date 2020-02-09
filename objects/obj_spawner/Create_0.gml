// Create a list of spawnpoints
spawn_list = ds_list_create();
for (var i = 0; i < instance_number(obj_spawnpoint); i++) {
	ds_list_add(spawn_list, instance_find(obj_spawnpoint, i));
}

spawn_is_ready = false;
spawn_weight_sum = 0;

// Monsters to spawn
enemy_data[0, 0] = obj_enm_skeleton;
enemy_data[0, 1] = 40;
enemy_data[1, 0] = obj_enm_imp;
enemy_data[1, 1] = 30;
enemy_data[2, 0] = obj_enm_shaman;
enemy_data[2, 1] = 20;
enemy_data[3, 0] = obj_enm_zombie;
enemy_data[3, 1] = 10;
	
enemies[global.difficulty_lvl] = ds_map_create();
ds_map_add(enemies[global.difficulty_lvl], "enemy_id", enemy_data[global.difficulty_lvl, 0]);
ds_map_add(enemies[global.difficulty_lvl], "spawn_weight", enemy_data[global.difficulty_lvl, 1]);
for (var i = 0; i < array_length_1d(enemies); i++) {
	var map = enemies[i];
	var weight = map[? "spawn_weight"];
	spawn_weight_sum += weight;
}

enemy_is_chosen = false;

// Spawner timers
counter_delay_spawn = 0;
timer_delay_spawn = room_speed * 2;

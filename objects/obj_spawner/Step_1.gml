if array_length_1d(enemies) - 1 < global.difficulty_lvl and global.difficulty_lvl < array_height_2d(enemy_data){
	enemies[global.difficulty_lvl] = ds_map_create();
	ds_map_add(enemies[global.difficulty_lvl], "enemy_id", enemy_data[global.difficulty_lvl,0]);
	ds_map_add(enemies[global.difficulty_lvl], "spawn_weight", enemy_data[global.difficulty_lvl, 1]);
	for (var i = 0; i < array_length_1d(enemies); i++) {
		var map = enemies[i];
		var weight = map[? "spawn_weight"];
		spawn_weight_sum += weight;
	}
}

if global.difficulty_lvl == 1 and enm_number_max != 6 {
	enm_number_max = 6;
}
if global.difficulty_lvl == 2 and enm_number_max != 8 {
	enm_number_max = 8;
	timer_delay_spawn = room_speed * 1.75;
}
if global.difficulty_lvl == 3 and enm_number_max != 10 {
	enm_number_max = 10;
}
if global.difficulty_lvl == 4 and enm_number_max != 12 {
	enm_number_max = 12;
	timer_delay_spawn = room_speed * 1.5;
}
if global.difficulty_lvl == 5 and enm_number_max != 14 {
	enm_number_max = 14;
}
if global.difficulty_lvl == 6 and enm_number_max != 16 {
	enm_number_max = 16;
	timer_delay_spawn = room_speed * 1.25;
}
if global.difficulty_lvl == 7 and enm_number_max != 18 {
	enm_number_max = 18;
}
if global.difficulty_lvl == 8 and enm_number_max != 20 {
	enm_number_max = 20;
	timer_delay_spawn = room_speed * 1;
}
if global.difficulty_lvl == 9 and enm_number_max != 22 {
	enm_number_max = 22;
}
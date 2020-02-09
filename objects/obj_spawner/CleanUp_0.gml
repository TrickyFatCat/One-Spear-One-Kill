ds_list_destroy(spawn_list);
for (var i = 0; i < array_length_1d(enemies); i++) {
	ds_map_destroy(enemies[i]);
}
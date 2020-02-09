var enm_number = instance_number(obj_enemy);

if obj_game_controller.state_current == game_state.active {
	if enm_number < enm_number_max {
		if counter_delay_spawn < timer_delay_spawn {
			counter_delay_spawn = min(counter_delay_spawn + global.timefactor, timer_delay_spawn);
			if (spawn_is_ready) {
				spawn_is_ready = !spawn_is_ready;
			}
			if (enemy_is_chosen) {
				enemy_is_chosen = !enemy_is_chosen;
			}
		}
		else {
			if (!spawn_is_ready) {
				// Choose spawn
				var length = ds_list_size(spawn_list);
				var spawn = ds_list_find_value(spawn_list, random(length));
				if spawn.state_current == spawn_state.ready {
					if (!enemy_is_chosen) {
						// Choose enemy
						var enemy_id = irandom_range(0, array_length_1d(enemies) - 1);
						var map = enemies[enemy_id];
						// Check chance
						var roll = irandom_range(1, spawn_weight_sum);
						var weight = map[? "spawn_weight"];
						if roll <= weight {
							spawn.spawn_target = map[? "enemy_id"];
							spawn.state_current = spawn_state.spawn_start;
							enemy_is_chosen = !enemy_is_chosen;
							spawn_is_ready = !spawn_is_ready;
						}
					}
				}
			}
			else if counter_delay_spawn > 0 {
				counter_delay_spawn = 0;
			}
		}
	}
}
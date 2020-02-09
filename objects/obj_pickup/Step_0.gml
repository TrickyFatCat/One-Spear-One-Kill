event_inherited();

if counter_lifespan < timer_lifespan {
	// Pulling logic
	if (is_pulling) {
		if (is_dropping) {
			is_dropping = !is_dropping;
		}
		var step = 1 / pull_step;
		t += step;
		z = sin(2 * pi * t) * 16 + z_base;
		var dir_to_player = point_direction(x, y, obj_player.x, obj_player.y);
		var pull_x = lengthdir_x(pull_spd, dir_to_player);
		var pull_y = lengthdir_y(pull_spd, dir_to_player);
		x += pull_x;
		y += pull_y;
	}
	else if (!is_dropping){
		var step = 1 / 128;
		t += step
		z = sin(2 * pi * t) * 2 + z_base;
	}

	// Dropping logic
	if (is_dropping) {
		if x != target_x and y != target_y {
			var step = 1 / 70;
			t += step;
			z = sin(2 * pi * t) * 4 + z_base;
			drop_t += drop_spd;
			x = lerp(x, target_x, drop_t);
			y = lerp(y, target_y, drop_t);
		}
		else {
			is_dropping = !is_dropping;
		}
	}
}
event_inherited();

// Set is damaged
if obj_player_spear.state_current = spear_state.dropped and (is_damaged) {
	is_damaged = !is_damaged;
}

// Set movement direction
direction = point_direction(x, y, target_x, target_y);

// Set movement speed
move_spd_x = lengthdir_x(move_spd_current, direction);
move_spd_y = lengthdir_y(move_spd_current, direction);
event_inherited();

// Friction and acceleration
if move_spd_friction > 0 and move_spd_current > 0 {
	move_spd_current = max(move_spd_current - move_spd_friction, 0);
}
if move_spd_friction > 0 and move_spd_current == 0 {
	instance_destroy();
}

if move_spd_acceleration > 0 and move_spd_current != move_spd_max {
	move_spd_current = min(move_spd_current + move_spd_acceleration, move_spd_max);
}

// Speed calculation
move_spd_x = lengthdir_x(move_spd_current,direction);
move_spd_y = lengthdir_y(move_spd_current,direction);
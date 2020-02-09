event_inherited();

// Set spear position
with spear {
	if state_current == spear_state.ready {
		x = other.x - lengthdir_x(spear_shift_current, direction);
		y = other.y - obj_player.spear_offset_y - lengthdir_y(spear_shift_current, direction);
		z = other.z;
	}
}
event_inherited();

var controller = obj_game_controller;

// Check controls
if hp_current > 0 {
	dir_x = controller.key_right - controller.key_left;
	dir_y = controller.key_down - controller.key_up;
}
else {
	dir_x = 0;
	dir_y = 0;
}

// Set is_moving
if dir_x != 0 or dir_y != 0 {
	is_moving = true;
}
else { 
	if (!is_jumping) {
		is_moving = false;
	}
	else {
		is_moving = true;
	}
}

// Set movement direction
if (is_moving) and (!is_jumping){
	direction = point_direction(0, 0, dir_x, dir_y);
	dir_current = direction;
}

// Player jump
if jump_charge_current != jump_charge_max {
	counter_jump_cd = approach(counter_jump_cd, timer_jump_cd, global.timefactor);
	if counter_jump_cd = timer_jump_cd {
		jump_charge_current = approach(jump_charge_current, jump_charge_max, 1);
		counter_jump_cd = 0;
	}
}
if (controller.key_jump) and jump_charge_current > 0 and (!is_jumping) {
	is_jumping = true;
	jump_charge_current = approach(jump_charge_current, 0, 1)
}
if (controller.key_jump) and jump_charge_current == 0 and (!is_jumping){
	if (!audio_is_playing(snd_player_no_spear)) {
		audio_play_sound(snd_player_no_spear, 1000, false);
	}
}
player_jump;

// Set movement speed
move_spd_x = lengthdir_x(move_spd_current, dir_current);
move_spd_y = lengthdir_y(move_spd_current, dir_current);
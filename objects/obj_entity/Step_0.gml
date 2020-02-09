/// @description Entity logic
event_inherited();

// Movement logic
if (is_moving) {
	if (!is_jumping) {
		if move_spd_current > move_spd_max {
			move_spd_current = approach(move_spd_current, move_spd_max, jump_spd_friction);
		}
		else {
			move_spd_current = approach(move_spd_current, move_spd_max, move_spd_acceleration);
		}
	}
	else {
		move_spd_current = approach(move_spd_current, jump_spd, jump_spd_acceleration);
	}
}
else {
	if move_spd_current > move_spd_max {
		move_spd_current = approach(move_spd_current, 0, jump_spd_friction);
	}
	else if move_spd_current != 0 {
		move_spd_current = approach(move_spd_current, 0, move_spd_friction);
	}
}
	
// Play sound
if (is_moving) and (is_onscreen) {
	counter_snd_step = approach(counter_snd_step, timer_snd_step, global.timefactor);
	if counter_snd_step == timer_snd_step {
		if (!audio_is_playing(snd_step)) {
			audio_play_sound(snd_step, snd_step_weight, false);
		}
		counter_snd_step = 0;
	}
}

// Change sprite
if (is_jumping) {
	sprite_index = spr_jump;
}
else if (is_moving) {
	sprite_index = spr_run;
}
else {
	sprite_index = spr_idle;
}

// Change sprite x scale
if (is_moving) {
	if direction <= 90 or direction >= 270 {
		draw_scale_x = 1; // Right
	}
	else {
		draw_scale_x = -1; // Left
	}
}
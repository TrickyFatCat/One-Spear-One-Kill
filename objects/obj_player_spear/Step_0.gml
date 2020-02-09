event_inherited();

// Local variables
var power_min = 0;
var power_a = (power_current - power_min) / (power_max - power_min);
var target_x = obj_player.x;
var target_y = obj_player.y;
var target_z = obj_player.z;

// Spear state machine
switch state_current {
	case spear_state.ready:
		// Set is_sorting
		if (is_sorting) {
			is_sorting = !is_sorting;
		}
		// Set spear direction
		direction = point_direction(x,y,mouse_x,mouse_y);
		image_angle = direction;
		// Check controls
			if (obj_game_controller.LMB_pressed) {
				if counter_cast != timer_cast {
					counter_cast = min(counter_cast + global.timefactor, timer_cast);
					var a = counter_cast / timer_cast;
					power_current = lerp(power_min, power_max, a);
					spear_shift_current = lerp(0, spear_shift_max, a);
					if (!audio_is_playing(snd_spear_charging)) and power_current < power_max {
						audio_play_sound(snd_spear_charging, 750, true);
					}
					audio_sound_pitch(snd_spear_charging, lerp(1, 2, a));
					if power_current == power_max {
						audio_stop_sound(snd_spear_charging);
						if (!snd_power_max) {
							audio_play_sound(snd_spear_max_charge, 750, false);
							snd_power_max = !snd_power_max;
						}
					}
				}
			}
			else if power_current > power_min {
				move_spd_current = lerp(move_spd_min, move_spd_max, power_a);
				dmg_current = floor(lerp(dmg_min, dmg_max, power_a));
				pierce_counter = round(lerp(pierce_min, pierce_max, power_a));
				spear_fly_direction = direction;
				initial_z = z;
				state_current = spear_state.fly;
			}
	break;
	
	case spear_state.fly:
		// Set is_sorting
		if (!is_sorting) {
			is_sorting = !is_sorting;
		}
		if (snd_power_max) {
			snd_power_max = !snd_power_max;
		}
		if (!snd_throw_play) {
			audio_play_sound(snd_spear_throw, 750, false);
			snd_throw_play = !snd_throw_play;
		}
		if (audio_is_playing(snd_spear_charging)) {
			audio_stop_sound(snd_spear_charging);
		}
		if move_spd_current > 0 {
			// Decrease spear_shift
			if spear_shift_current != 0 {
				spear_shift_current = max(spear_shift_current - 0.5, 0);
			}
			
			// Set movement speed
			move_spd_current = max(move_spd_current - move_spd_friction, 0);
			move_spd_x = lengthdir_x(move_spd_current,spear_fly_direction);
			move_spd_y = lengthdir_y(move_spd_current,spear_fly_direction);
			
			// Sret damage
			var a = move_spd_current / move_spd_max;
			power_current = lerp(power_current, power_min, a);
			if z > 0 {
				z = lerp(0, initial_z, a * a);
			}
			if z <= z_max and (!is_sorting) {
				is_sorting = !is_sorting;
			}
			
			// Move spear
			x += move_spd_x;
			y += move_spd_y;
		}
		else {
			state_current = spear_state.dropped;
		}
		
	break;
	
	case spear_state.dropped:
		if counter_air != 0 {
			counter_air = 0;
		}
		if (snd_throw_play) {
			snd_throw_play = !snd_throw_play;
		}
		if (audio_is_playing(snd_spear_throw)) {
			audio_stop_sound(snd_spear_throw);
		}
		if (!snd_dropped) {
			audio_play_sound(snd_spear_dropped, 750, false);
			snd_dropped = !snd_dropped;
		}
		if counter_cast != 0 {
			power_current = power_min;
			counter_cast = 0;
		}
		if initial_x != x and initial_y != y {
			initial_x = x;
			initial_y = y;
			initial_z = z;
		}
		else {
			if point_distance(x, y, target_x, target_y) <= 32 and (!obj_player.is_jumping) {
				state_current = spear_state.taking;
			}
		}
			
	break;
	
	case spear_state.taking:
		if (snd_dropped) {
			snd_dropped = !snd_dropped;
		}
		counter_taking = approach(counter_taking, timer_taking, global.timefactor);
		if counter_taking < timer_taking {
			var a = counter_taking / timer_taking;
			x = lerp(initial_x, target_x, a * a);
			y = lerp(initial_y, target_y, a * a);
			z = lerp(initial_z, target_z, a * a);
		}
		else {
			audio_play_sound(snd_player_return_spear, 1000, false);
			counter_taking = 0;
			state_current = spear_state.ready;
		}
	break;
}
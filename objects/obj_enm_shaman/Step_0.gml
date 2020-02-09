event_inherited();

// Shaman state machine
switch state_current {
	case shaman_state.idle:
		if (is_moving) {
			is_moving = !is_moving;
		}
		scr_enemy_activation(shaman_state.move);
	break;
	
	case shaman_state.move:
		scr_enemy_check_player_hp(shaman_state.idle);
		scr_enemy_move_to_player(shoot_dist, shaman_state.attack);
	break;
	
	case shaman_state.attack:
		if (is_moving) {
			withdraw_dir_ready = false;
			is_moving = !is_moving;
		}
		if counter_cast < timer_cast {
			if projectile == noone {
				projectile = instance_create_layer(x, y + 1, layer, obj_projectile_enemy_shaman);
			}
			counter_cast = min(counter_cast + global.timefactor, timer_cast);
			var a = counter_cast / timer_cast;
			with projectile {
				image_xscale = lerp(0, 0.5, a);
				image_yscale = image_xscale;
			}
			// Play cast sound
			if (is_onscreen) {
				if (!audio_is_playing(snd_enm_shaman_cast)) {
					audio_play_sound(snd_enm_shaman_cast, 3, true);
				}
				else {
					audio_sound_pitch(snd_enm_shaman_cast, lerp(1, 2, a));
				}
			}
			else {
				if (audio_is_playing(snd_enm_shaman_cast)) {
					audio_stop_sound(snd_enm_shaman_cast);
				}
			}
		}
		else {
			if (audio_is_playing(snd_enm_shaman_cast)) {
				audio_stop_sound(snd_enm_shaman_cast);
			}
			if projectile != noone {
				with projectile {
					direction = point_direction(x, y, obj_player.x, obj_player.y);
					move_spd_current = 2;
				}
				audio_play_sound(snd_enm_shaman_shoot, 5, false);
				projectile = noone;
			}
			if (!scr_enemy_check_distance(shoot_dist, shaman_state.move)) {
				state_current = shaman_state.withdraw;
			}
		}
	break;
	
	case shaman_state.withdraw:
		scr_enemy_check_player_hp(shaman_state.idle);
		if projectile != noone {
			projectile = noone;
		}
		if counter_cast > 0 {
			counter_cast = 0;
		}
		if (!is_moving) {
			is_moving = !is_moving;
		}
		if (!withdraw_dir_ready) {
			var dir_1 = random_range(45, 135);
			var dir_2 = random_range(225, 315);
			withdraw_dir = choose(dir_1, dir_2);
			target_x = x + lengthdir_x(withdraw_dist, withdraw_dir);
			target_y = y + lengthdir_y(withdraw_dist, withdraw_dir);
			withdraw_dir_ready = !withdraw_dir_ready;
		}
		else {
			if point_distance(x, y, target_x, target_y) <= 5 {
				state_current = shaman_state.attack;
			}
		}
	break;
}
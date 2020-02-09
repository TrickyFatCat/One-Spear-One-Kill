/// @description Jump
if (is_jumping) {
	is_invulnerable = true;
	dir_current = direction;
	counter_jump = approach(counter_jump, timer_jump, global.timefactor);
	if counter_jump < timer_jump {
		if (!snd_jump_played) {
			audio_play_sound(snd_player_jump, 1000, false);
			snd_jump_played = !snd_jump_played;
		}
		var a = counter_jump / timer_jump;
		z = lerp(z, 48, a * a);
		move_spd_current = approach(move_spd_current, jump_spd, jump_spd_acceleration);
	}
	else {
		counter_air = approach(counter_air, timer_air, global.timefactor);
		if counter_air != timer_air {
			if (!gravity_is_active) {
				gravity_is_active = !gravity_is_active;
			}
			var a = counter_air / timer_air;
			grav = lerp(0, 0.1, a * a);
		}
		else if floor(spd_z) == 0 {
			if (snd_jump_played) {
				audio_play_sound(snd_player_jump_end, 1000, false);
				snd_jump_played = !snd_jump_played;
			}
			counter_jump = 0;
			counter_air = 0;
			gravity_is_active = false;
			jump_invulnerability = true;
			counter_jump_invulnerability = 0;
			is_jumping = !is_jumping;
		}
	}
}
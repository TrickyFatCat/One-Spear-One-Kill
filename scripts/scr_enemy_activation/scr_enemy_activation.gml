/// @param next_state

var state = argument0;
if is_spawned and obj_player.hp_current > 0{
	if counter_activation < timer_activation {
		counter_activation = min(counter_activation + global.timefactor, timer_activation);
		var a = counter_activation / timer_activation;
		draw_alpha = lerp(0, 1, a);
		scr_set_flash(c_red, 1);
		// Play cast sound
		if (is_onscreen) {
			if (!audio_is_playing(snd_enm_all_teleportation)) {
				audio_play_sound(snd_enm_all_teleportation, 3, true);
			}
			else {
				audio_sound_pitch(snd_enm_all_teleportation, lerp(0.5, 1, a));
			}
		}
		else {
			if (audio_is_playing(snd_enm_all_teleportation)) {
				audio_stop_sound(snd_enm_all_teleportation);
			}
		}
	}
	else {
		if (audio_is_playing(snd_enm_all_teleportation)) {
				audio_stop_sound(snd_enm_all_teleportation);
			}
		state_current = state;
	}
}
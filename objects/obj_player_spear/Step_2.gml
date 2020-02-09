// Play sound without spear
if (obj_game_controller.LMB_pressed) and state_current != spear_state.ready and state_current != spear_state.taking {
	if (!snd_nospear) and (!audio_is_playing(snd_player_no_spear)) {
			audio_play_sound(snd_player_no_spear, 500, false);
		snd_nospear = !snd_nospear;
	}
}
else if (snd_nospear) {
	snd_nospear = !snd_nospear;		
}

// Set is_sorting
if z > z_max and (is_sorting) {
	is_sorting = !is_sorting;
}
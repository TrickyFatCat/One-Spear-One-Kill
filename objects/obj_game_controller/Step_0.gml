/// @description Checking controls
scr_player_controls();

// Game state machine
switch state_current {
	case game_state.idle:
		if obj_gui.state_current == gui_state.hud {
			state_current = game_state.start;
		}
	break;
	
	case game_state.start:
		// Play sounds
		if (!audio_group_is_loaded(ag_sounds_game)) {
			audio_group_load(ag_sounds_game);
		}
		// Start counter
		if counter_start < timer_start {
			counter_start = min(counter_start + global.timefactor, timer_start);
			counter_sound_starttimer = approach(counter_sound_starttimer, timer_sound_starttimer, global.timefactor);
			if counter_sound_starttimer == timer_sound_starttimer {
				if (!audio_is_playing(snd_timer_start)) {
					audio_play_sound(snd_timer_start, 1000, false);
					var a = counter_start / timer_start;
					audio_sound_gain(snd_timer_start, lerp(0.25, 0.75, a), 0);
					audio_sound_pitch(snd_timer_start, lerp(1, 1.25, a));
					counter_sound_starttimer = 0;
				}
			}
		}
		else {
			// Play music
			if (!audio_is_playing(music)) {
				audio_sound_gain(music, 0, 0);
				audio_play_sound(music, 1000, true);
				audio_sound_gain(music, 0.2, 1000);
			}
			state_current = game_state.active;
		}
	break;
	
	case game_state.active:
		if counter_start != 0 {
			counter_start = 0;
		}
		global.game_time += global.timefactor;
		if array_length_1d(timer_diffivculty) - 1 >= global.difficulty_lvl {
			if global.game_time > timer_diffivculty[global.difficulty_lvl] {
				global.difficulty_lvl++;
			}
		}
		if obj_player.hp_current == 0 {
			if audio_is_playing(music) {
				audio_stop_sound(music);
			}
			else {
				audio_play_sound(snd_gameover, 0, false);
				audio_group_unload(ag_sounds_game);
				state_current = game_state.finish;
			}
		}
		if (global.save_combo) {
			global.counter_combo = approach(global.counter_combo, global.timer_combo, global.timefactor);
			if global.counter_combo == global.timer_combo {
				global.combo = 0;
				global.save_combo = false;
			}
			else if global.combo > global.best_combo {
				global.best_combo = global.combo;
			}
		}
		else if global.counter_combo != 0 {
			global.counter_combo = 0;
		}
	break;
	
	case game_state.finish:
		if (!enter_battle) {
			enter_battle = !enter_battle;
		}
	break;
}
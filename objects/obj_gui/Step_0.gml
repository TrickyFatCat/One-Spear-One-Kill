switch state_current {
	case gui_state.menu_start:
		if (obj_game_controller.key_start) {
			audio_play_sound(snd_start, 1000, false);
			state_current = gui_state.transition_open;
		}
		if (obj_game_controller.key_finish){
			game_end();
		}
		if counter_start_text_show < timer_start_text {
			counter_start_text_show = min(counter_start_text_show + global.timefactor, timer_start_text);
			if (!show_start_text) {
				audio_play_sound(snd_press_space, 1000,false);
				show_start_text = !show_start_text;
			}
			if counter_start_text_hide > 0 {
				counter_start_text_hide = 0
			}
		}
		else {
			if counter_start_text_hide < timer_start_text {
				counter_start_text_hide = min(counter_start_text_hide + global.timefactor, timer_start_text);
				if (show_start_text) {
					show_start_text = !show_start_text;
				}
			}
			else {
				if counter_start_text_show > 0 {
					counter_start_text_show = 0;
				}
			}
		}
	break;
		
	case gui_state.transition_open:
		if percent != 0 {
			percent = max(0, percent - max((percent / 10), 0.005));
		}
		else {
			state_current = gui_state.hud;
		}
			
	break;
		
	case gui_state.hud:
		if (show_enterbatte_text) {
			counter_enterbattle_text = approach(counter_enterbattle_text, timer_enterbattle_text, global.timefactor);
		}
		if obj_game_controller.state_current == game_state.finish {
			state_current = gui_state.transition_close;
		}
	break;
		
	case gui_state.transition_close:
		if percent != 1 {
			percent = min(1, percent + max(((1 - percent) / 10), 0.005));
		}
		else {
			state_current = gui_state.menu_finish;
		}
	break;
	
	case gui_state.menu_finish:
		if (obj_game_controller.key_start) {
			room_restart();
		}
		if (obj_game_controller.key_finish){
			game_end();
		}
				if counter_start_text_show < timer_start_text {
			counter_start_text_show = min(counter_start_text_show + global.timefactor, timer_start_text);
			if (!show_start_text) {
				audio_play_sound(snd_press_space, 1000,false);
				show_start_text = !show_start_text;
			}
			if counter_start_text_hide > 0 {
				counter_start_text_hide = 0
			}
		}
		else {
			if counter_start_text_hide < timer_start_text {
				counter_start_text_hide = min(counter_start_text_hide + global.timefactor, timer_start_text);
				if (show_start_text) {
					show_start_text = !show_start_text;
				}
			}
			else {
				if counter_start_text_show > 0 {
					counter_start_text_show = 0;
				}
			}
		}
	break;
}
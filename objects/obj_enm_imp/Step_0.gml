event_inherited();

// Imp state machine
switch state_current {
	case imp_state.idle:
		if (is_moving) {
			is_moving = !is_moving;
		}
		scr_enemy_activation(imp_state.move);
	break;
	
	case imp_state.move:
		scr_enemy_check_player_hp(imp_state.idle);
		scr_enemy_move_to_player(shoot_dist, imp_state.explode);
	break;
	
	case imp_state.explode:
		if (is_moving) {
			is_moving = !is_moving;
		}
		if counter_explosion < timer_explosion {
			counter_explosion = min(counter_explosion + global.timefactor, timer_explosion);
			var a = counter_explosion / timer_explosion;
			draw_scale_x = lerp(draw_scale_x, 2, a);
			draw_scale_y = draw_scale_x;
			scr_set_flash(c_red, 0.75);
			if (!snd_explosion_timer) {
				audio_play_sound(snd_enm_imp_explosion_timer, 5, false);
				snd_explosion_timer = !snd_explosion_timer;
			}
		}
		else {
			points_add = 0;
			instance_destroy();
		}
	break;
}
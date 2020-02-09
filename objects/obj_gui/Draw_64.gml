var c_green_811620 = make_color_rgb(81, 162, 0)
var c_green_11324364 = make_color_rgb(113, 243, 65)
var c_red_162480 = make_color_rgb(162, 48, 0);
var c_orange_25512148 = make_color_rgb(255, 121, 48);

if state_current != gui_state.hud {
	draw_background;
}

switch state_current {
	case gui_state.menu_start:
		// Draw title
		scr_gui_set_align(fa_center, fa_center);
		scr_gui_text_with_tilt(fnt_title, w_half, 0, 50, 2, c_green_811620, c_green_11324364, "ONE SPEAR, ONE KILL");
		
		// Draw welcome
		scr_gui_text_with_tilt(fnt_normal, w_half, 0, h * 0.27, 2, c_red_162480, c_orange_25512148, "ULTIMATE ARENA MAYHEM!");
		scr_gui_set_align_default();
	break;
		
	case gui_state.transition_open:
	break;
		
	case gui_state.hud:
		// Draw points
		draw_set_font(fnt_small);
		scr_gui_set_align(fa_right, fa_center);
		scr_draw_text_outline(w * 0.38, 20, c_black, c_white, "SCORE");
		scr_gui_set_align(fa_center, fa_center);
		scr_draw_text_outline(w * 0.338, 40, c_black, c_white, string(global.points));
		
		// Draw timer
		scr_gui_set_align(fa_left, fa_center);
		scr_draw_text_outline(w * 0.62, 20, c_black, c_white, "TIME");
		scr_gui_set_align(fa_center, fa_center);
		scr_draw_text_outline(w * 0.652, 40, c_black, c_white, string(global.game_time / 60));
		
		// Draw combo
		if (global.save_combo) {
			// Draw combo timer
			var k = round((global.timer_combo - global.counter_combo) / 60)
			var spr = spr_combo_timer;
			var spr_w = sprite_get_width(spr);
			var spr_delta = 2;
			var step = spr_w + spr_delta;
			var xx = ((w_half + spr_w * k / 2) - spr_w * round(global.timer_combo / 60) / 2) + spr_delta;
			var pos_y = 70;
			for (var i = 0; i < k; i++) {
				var pos_x = (xx - spr_w * k / 2) + step * i;
				draw_sprite(spr, image_index, pos_x, pos_y);
			}
			
			// Draw combo text
			draw_set_font(fnt_normal);
			scr_gui_set_align(fa_center, fa_center);
			scr_draw_text_outline(w * 0.5, 27, c_red_162480, c_orange_25512148, "COMBO");
			scr_draw_text_outline(w * 0.5, 55, c_red_162480, c_orange_25512148, "x" + string(global.combo));
			scr_gui_set_align_default();
		}
		
		// Draw start counter
		if obj_game_controller.counter_start < obj_game_controller.timer_start and obj_game_controller.state_current == game_state.start {
			var t = round((obj_game_controller.timer_start - obj_game_controller.counter_start) / 60);
			if t > 0 {
				scr_gui_set_align(fa_center, fa_center);
				scr_gui_text_with_tilt(fnt_normal, w_half, 0, h * 0.25, 2, c_green_811620, c_green_11324364, "THE BATTLE STARTS IN");
				scr_gui_text_with_tilt(fnt_big, w_half + 2, 0, h * 0.45, 2, c_green_811620, c_green_11324364, string(t));
				scr_gui_set_align_default();
			}
			else {
				if (!audio_is_playing(snd_enter_battle)) {
					show_enterbatte_text = true;
					audio_play_sound(snd_enter_battle, 1000, false);
				}
			}
		}
		if (show_enterbatte_text) {
			if counter_enterbattle_text < timer_enterbattle_text {
				scr_gui_set_align(fa_center, fa_center);
				scr_gui_text_with_tilt(fnt_title, w_half, 0, h_half, 2, c_red_162480, c_orange_25512148, "FIGHT WITH GLORY!");
				scr_gui_set_align_default();
			}
			else {
				show_enterbatte_text = !show_enterbatte_text;
			}
		}
		
		//Draw jump CD
		draw_set_color(c_white);
		var pos_x = w_half;
		var pos_y = h - 40;
		var scale = 1;
		var cd_c = round(obj_player.counter_jump_cd / 60);
		var cd_t = round(obj_player.timer_jump_cd / 60);
		var a = cd_c / cd_t;
		var alpha = lerp(0, 1, a);
		if obj_player.counter_jump_cd != 0 {
			var blend = c_red_162480;
		}
		else {
			var blend = c_green_11324364;
		}
		// Draw fill
		switch obj_player.jump_charge_current {
			case 2:
				draw_sprite_ext(spr_jump_fill, image_index, pos_x + 10, pos_y, scale, scale, image_angle, blend, 1);
				draw_sprite_ext(spr_jump_fill, image_index, pos_x - 10, pos_y, scale, scale, image_angle, blend, 1);
			break;
			case 1:
				draw_sprite_ext(spr_jump_fill, image_index, pos_x + 10, pos_y, scale, scale, image_angle, blend, alpha);
				draw_sprite_ext(spr_jump_fill, image_index, pos_x - 10, pos_y, scale, scale, image_angle, c_green_11324364, 1);
			break;
			case 0:
				draw_sprite_ext(spr_jump_fill, image_index, pos_x - 10, pos_y, scale, scale, image_angle, blend, alpha);
			break;
		}
		draw_sprite_ext(spr_jump_stroke, image_index, pos_x - 10, pos_y, scale, scale, image_angle, image_blend, 1);
		draw_sprite_ext(spr_jump_stroke, image_index, pos_x + 10, pos_y, scale, scale, image_angle, image_blend, 1);
		
		//Draw player hp
		var spr = spr_hp_empty;
		var spr_w = sprite_get_width(spr);
		var step = spr_w + 14;
		var k = round(obj_player.hp_max / 2);
		var xx = w_half - ((spr_w * k) + (step * k - 1));
		var pos_y = h - 15;
		for (var i = 0; i < obj_player.hp_max; i++) {
			var pos_x = (xx + spr_w * (k + 1)) + step * i;
			draw_sprite_ext(spr, image_index, pos_x, pos_y, 2, 2, image_angle, image_blend, 1);
		}
		for (var i = 0; i < obj_player.hp_current; i++) {
			var spr = spr_hp_full;
			var pos_x = (xx + spr_w * (k + 1)) + step * i;
			draw_sprite_ext(spr, image_index, pos_x, pos_y, 2, 2, image_angle, image_blend, 1);
		}
		
		// Draw crosshair
		draw_sprite(spr_crosshair, image_index, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
	break;
		
	case gui_state.transition_close:
	break;
	
	case gui_state.menu_finish:
		scr_gui_set_align(fa_center, fa_center);
		scr_gui_text_with_tilt(fnt_title, w_half, 0, 50, 2, c_red_162480, c_orange_25512148, "GAME OVER");
		// Draw score
		var ww = w_half + 2;
		var hh = h * 0.3;
		var hhh = hh + 32;
		scr_gui_text_with_tilt(fnt_normal, ww, 0, hh, 1, c_green_811620, c_green_11324364, "SCORE");
		scr_gui_text_with_tilt(fnt_normal, ww, 0, hhh, 1, c_green_811620, c_green_11324364, string(global.points));
		// Draw stats
		draw_set_font (fnt_small);
		draw_set_color(c_ltgray);
		var hh = h * 0.66;
		var hhh = hh + 20;
		// Draw time
		draw_text(w_quarter, hh, "TIME");
		draw_text(w_quarter, hhh, string(global.game_time / 60));
		// Draw kills
		draw_text(w_half, hh, "KILLS");
		draw_text(w_half, hhh, string(global.kills_counter));
		// Draw best combo
		draw_text(w_third, hh, "BEST COMBO");
		draw_text(w_third, hhh, string(global.best_combo));
		scr_gui_set_align_default();
	break;
}


if state_current == gui_state.menu_start or state_current == gui_state.menu_finish {
	scr_gui_set_align(fa_center, fa_center);
	
	// Draw press space
	if (show_start_text) {
		scr_gui_text_with_tilt(fnt_normal, w_half, 0, h * 0.517, 2, c_orange_25512148, c_red_162480, "PRESS [SPACE] TO START");
	}
	
	// Draw welcome and instructions
	draw_set_font(fnt_small);
	draw_set_color(c_gray);
	var hh = h - 30;
	draw_text(w * 0.2, hh, "Use WASD to move.");
	draw_text(w_half, hh, "Hold LMB to shoot.");
	draw_text(w * 0.8, hh, "Press SPACE to jump.");
	scr_gui_set_align_default();
}

draw_set_color(c_white);
//draw_line(w_half, 0, w_half, h); //Horizontal
//draw_line(0, h_half, w, h_half); //Vertical
//draw_line(w_quarter, 0, w_quarter, h); //Third
//draw_line(0, h_quarter, w, h_quarter);
//draw_line(w_third, 0, w_third, h); //Third
//draw_line(0, h_third, w, h_third);


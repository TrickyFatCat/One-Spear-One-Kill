#macro draw_background event_user(0)

display_set_gui_size(view_wport[0], view_hport[0]);

draw_set_font(fnt_normal);

w = display_get_gui_width();
h = display_get_gui_height();

w_quarter = w * 0.25;
h_quarter = h * 0.25;
w_half = w * 0.5;
h_half = h * 0.5;
w_third = w * 0.75;
h_third = h * 0.75;

// GUI states
enum gui_state
	{
		menu_start,
		transition_open,
		hud,
		transition_close,
		menu_finish
	}
state_current = gui_state.menu_start;
percent = 1;

// GUI variables
show_start_text = true;
counter_start_text_hide = 0;
counter_start_text_show = 0;
timer_start_text = room_speed * 0.75;
show_enterbatte_text = false;
counter_enterbattle_text = 0;
timer_enterbattle_text = room_speed * 1.5;
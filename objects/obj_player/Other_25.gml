/// @description Draw logic
event_inherited();

if visible and obj_player_spear.state_current == spear_state.ready {
	for (var i = 0; i < obj_player_spear.power_current; i++) {
		var spr = spr_power_point;
		var step = sprite_get_width(spr) + 1;
		var heart_pos_x = (x - sprite_get_width(spr) * obj_player_spear.power_max / 2) + step * i;
		var heart_pos_y = bbox_top - 6;
		draw_sprite_ext(spr, image_index, heart_pos_x, heart_pos_y - z, 1, 1, draw_angle, draw_colour, draw_alpha);
	}
}
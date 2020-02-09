event_inherited();

if visible {
	for (var i = 0; i < hp_current; i++) {
		var spr = spr_enm_heart;
		var step = sprite_get_width(spr) + sprite_get_width(spr);
		var heart_pos_x = (x - sprite_get_width(spr) * (hp_max / 2)) + step * i * 0.75;
		//var heart_pos_x = (x - 13) + 9 * i;
		var heart_pos_y = bbox_top - 6;
		draw_sprite_ext(spr, image_index, heart_pos_x, heart_pos_y - z, 1, 1, draw_angle, draw_colour, draw_alpha);
	}
}
/// @description Draw event

if visible {
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, image_angle, draw_colour, draw_alpha);
	gpu_set_blendmode(bm_normal);
	draw_sprite_ext(spr_circle_glow, image_index, x, y - (sprite_height * 0.5) - z, image_xscale * 0.75, image_yscale * 0.75, image_angle, c_white, draw_alpha);
}
// Draw floor objects
with obj_floor {
	draw_event;
}

// Draw shadows
if (surface_exists(surface_shadows)) {
	surface_set_target(surface_shadows)
	draw_clear_alpha(c_black, 0.0)
	with obj_base {
		if shadow_is_active {
			draw_sprite_ext(spr_circle, image_index, x - cam_x, y - cam_y, shadow_scale_x, shadow_scale_y, 0, c_black, shadow_alpha);
		}
	}
	surface_reset_target();
	draw_surface_ext(surface_shadows, cam_x, cam_y, 1, 1, 0, c_white, 1);
}
else {
	surface_shadows = surface_create(cam_w, cam_h);
}

// Draw sortable objects
for (var i = 0; i < ds_list_size(draw_list); i++) {
	var inst = draw_list[| i];
	with inst draw_event;
}

// Draw spear
if (!obj_player_spear.is_sorting) {
	with obj_player_spear draw_event;
}

// Draw unsortable objects
with obj_unsortable {
	draw_event;
}

// Draw flash
gpu_set_blendmode(bm_add);
with obj_base {
	shader_set(flash_shader);
	shader_set_uniform_f(flash_alpha, flash_power);
	draw_sprite_ext(sprite_index, image_index, x, y - z, draw_scale_x, draw_scale_y, draw_angle, flash_colour, image_alpha);
	shader_reset();
}
gpu_set_blendmode(bm_normal);
/// @description Basic parametrs

// Draw params
draw_scale_x = image_xscale;
draw_scale_y = image_yscale;
draw_angle = image_angle;
draw_colour = image_blend;
draw_alpha = image_alpha;
is_onscreen = false;

// Gravity params
gravity_is_active = false;
z = 0;
z_max = 96;
spd_z = 0;
grav = 0.1;
bounce_coef = 0;

// Flash shader
flash_spd_decr = 0.05;
flash_power = 0;
flash_shader = shd_flash;
flash_alpha = shader_get_uniform(shd_flash, "u_alpha");
flash_colour = c_red;

// Shadow
shadow_is_active = false;
shadow_delta = 0;
shadow_scale_x = 1;
shadow_scale_y = 1;
shadow_alpha = 1;
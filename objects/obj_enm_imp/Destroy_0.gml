event_inherited();

var explosion = instance_create_layer(x, y, layer, obj_explosion_enemy_imp);
with explosion {
	dmg_current = other.dmg_current;
	var scale_factor_x = other.explosion_radius / sprite_width;
	var scale_factor_y = other.explosion_radius / sprite_height;
	image_xscale = image_xscale * scale_factor_x;
	image_yscale = image_yscale * scale_factor_y;
}
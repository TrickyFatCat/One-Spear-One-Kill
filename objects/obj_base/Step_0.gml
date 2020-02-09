/// @description Base step

// Gravity logic
if gravity_is_active {
	if (z + spd_z <= 0) {
		spd_z *= -bounce_coef;
		z = 0;
	}
	else {
		spd_z -= grav;
		z += spd_z;
	}
}

// Set shadow alpha
if z > 0 {
	shadow_alpha = lerp(1, 0, (min(z, z_max) / z_max));
}

// Decrese flash
if flash_power > 0 {
	flash_power = max(flash_power - flash_spd_decr, 0);
}
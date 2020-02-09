event_inherited();

// Projectile movement
image_angle = direction;
move_spd_x = 0;
move_spd_y = 0;
move_spd_current = move_spd_min + random_range(move_spd_delta * -1, move_spd_delta);

// Projectile damege
dmg_current = dmg_max;
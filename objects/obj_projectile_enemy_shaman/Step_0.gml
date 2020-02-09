event_inherited();

if move_spd_current > 0 {
	if (!scr_enemy_counter_shoot()) {
		var projectile = instance_create_layer(x, y, layer, obj_projectile_enemy_shaman_small);
		with projectile {
			direction = random_range(0, 359);
		}
		if (is_onscreen) {
			audio_play_sound(snd_enm_shaman_shoot_small, 1, false);
		}
		counter_shoot = 0;
	}
}
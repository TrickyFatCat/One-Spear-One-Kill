if hp_current > 0 and (!is_jumping) {
	hp_current = min(hp_current + other.hp_restore, hp_max);
	instance_destroy(other);
	scr_set_flash(c_green, 1);
	audio_play_sound(snd_pickup_potion, 750, false);
}
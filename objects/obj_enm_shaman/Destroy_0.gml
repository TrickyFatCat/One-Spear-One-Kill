event_inherited();

if projectile != noone {
	instance_destroy(projectile);
}

if (audio_is_playing(snd_enm_shaman_cast)) {
	audio_stop_sound(snd_enm_shaman_cast);
}
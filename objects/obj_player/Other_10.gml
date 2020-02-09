/// @description Player gets damage
if (!is_jumping) {
	if (!is_invulnerable) {
		if counter_dmg_invulnerability != 0 {
			counter_dmg_invulnerability = 0;
		}
		scr_do_damage();
		scr_set_shake(other.shake_is_angular, other.shake_value);
		if (!audio_is_playing(snd_player_take_dmg)) {
			audio_play_sound(snd_player_take_dmg, 750, false);
		}
		dmg_invulnerability = true;
		is_invulnerable = true;
	}
}
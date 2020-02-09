if state_current == spear_state.fly and z <= z_max {
	if (!other.is_damaged) {
		// Recalulate speed
		if pierce_counter > 0 {
			pierce_counter = max(pierce_counter - 1, 0);
		}
		else {
			move_spd_current -= pierce_friction;
		}
		
		// Increase combo points
		global.combo++;
		if global.combo > 1 {
			if  (!global.save_combo) {
				global.save_combo = true;
			}
			else {
				global.counter_combo = 0;
			}
		}
		global.camera.shake_angular_active = true;
		global.camera.shake_value = lerp(0.75, 2.25, min(global.combo / 4, 1));
	
		// Do damge to an enemy
		with other {
		scr_do_damage();
		if hp_current > 0{
			audio_play_sound(snd_spear_hit_enemy, 3, false);
		}
		else {
			audio_play_sound(snd_spear_hit_enemy, 3, false);
			global.kills_counter++;
			instance_destroy();
		}
		scr_set_flash(c_orange, 1.5);
		is_damaged = !is_damaged;
		}
	}
}
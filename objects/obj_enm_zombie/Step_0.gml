event_inherited();

// Zombie state machine
switch state_current {
	case zombie_state.idle:
		if (is_moving) {
			is_moving = !is_moving;
		}
		scr_enemy_activation(skeleton_state.move);
	break;
	
	case zombie_state.move:
		if (is_spawned) {
			is_spawned = !is_spawned;
		}
		if (snd_shoot) {
			snd_shoot = !snd_shoot;
		}
		scr_enemy_check_player_hp(zombie_state.idle);
		scr_enemy_move_to_player(shoot_dist, zombie_state.attack);
	break;
	
	case zombie_state.attack:
		if (is_moving) {
			is_moving = !is_moving;
		}
		if (!scr_enemy_counter_shoot()) {
			for (var i = 0; i < projectiles_number; i++) {
				var projectile = instance_create_layer(x, y, layer, obj_projectile_enemy_zombie);
				var angle = spread_angle / 2
				var shoot_dir = point_direction(x, y, obj_player.x, obj_player.y) - random_range(angle * -1, angle);
				with projectile {
					direction = shoot_dir;
					image_angle = direction;
				}
			}
			if i == projectiles_number {
				if (!snd_shoot) {
					audio_play_sound(snd_enm_zombie_shoot, 5, false);
					snd_shoot = !snd_shoot;
				}
				if (!scr_enemy_check_distance(shoot_dist, zombie_state.move)) {
					counter_shoot = 0;
				}
			}
		}
		else {
			if (snd_shoot) {
				snd_shoot = !snd_shoot;
			}
			scr_set_flash(c_red, 2);
		}
		scr_enemy_check_player_hp(zombie_state.idle);
	break;
}
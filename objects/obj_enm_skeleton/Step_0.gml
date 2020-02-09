event_inherited();

// Skeleton state machine
switch state_current {
	case skeleton_state.idle:
		if (is_moving) {
			is_moving = !is_moving;
		}
		scr_enemy_activation(skeleton_state.move);
	break;
	
	case skeleton_state.move:
		if (is_spawned) {
			is_spawned = !is_spawned;
		}
		if (snd_shoot) {
			snd_shoot = !snd_shoot;
		}
		scr_enemy_check_player_hp(skeleton_state.idle);
		scr_enemy_move_to_player(shoot_dist, skeleton_state.attack);
	break;
	
	case skeleton_state.attack:
		if (is_moving) {
			is_moving = !is_moving;
		}
		if (!scr_enemy_counter_shoot()) {
			var projectile = instance_create_layer(x, y, layer, obj_projectile_enemy_skeleton);
			with projectile {
				direction = point_direction(x, y, obj_player.x, obj_player.y);
				image_angle = direction;
			}
			if (!snd_shoot) and (is_onscreen) {
				audio_play_sound(snd_enm_skeleton_shoot, 5, false);
				snd_shoot = !snd_shoot;
			}
			if (!scr_enemy_check_distance(shoot_dist, skeleton_state.move)) {
				counter_shoot = 0;
			}
		}
		else if (snd_shoot) {
			snd_shoot = !snd_shoot;
		}
		scr_enemy_check_player_hp(skeleton_state.idle);
}
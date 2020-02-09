event_inherited();

// Spawn point state machine
switch state_current {
	case spawn_state.ready:
	break;
	
	case spawn_state.spawn_start:
		if counter_delay_spawn < timer_delay_spawn {
			counter_delay_spawn = min(counter_delay_spawn + global.timefactor, timer_delay_spawn);
			var a = counter_delay_spawn / timer_delay_spawn;
			draw_alpha = lerp(0, 1, a);
		}
		else {
			state_current = spawn_state.spawn_finish;
		}
	break;
	
	case spawn_state.spawn_finish:
		if counter_delay_spawn != 0 {
			counter_delay_spawn = 0;
		}
		if spawn_enemy == noone {
			spawn_enemy = instance_create_layer(x, y, "entities", spawn_target);
		}
		else {
			if draw_alpha != 0{
				alpha_lerp_t = min(alpha_lerp_t + alpha_lerp_spd, 1)
				draw_alpha = lerp(1, 0, alpha_lerp_t);
			}
			else {
				state_current = spawn_state.occupied;
			}
		}
	break;
	
	case spawn_state.occupied:
		if (!instance_exists(spawn_enemy)) {
			spawn_enemy = noone;
			state_current = spawn_state.ready;
			
		}
	break;
}
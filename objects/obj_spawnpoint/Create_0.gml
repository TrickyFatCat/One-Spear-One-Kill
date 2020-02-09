event_inherited();

draw_scale_x = 2;
draw_scale_y = 1;
draw_colour = c_red;
draw_alpha = 0;

// Alpha lerp
alpha_lerp_spd = 0.03;
alpha_lerp_t = 0;

// Spawn point states
enum spawn_state {
	ready,
	spawn_start,
	spawn_finish,
	occupied
}

state_current = spawn_state.ready;

// Enemy to spawn
spawn_target = obj_enm_skeleton;
spawn_enemy = noone;

// Spawn timers
counter_delay_spawn = 0;
timer_delay_spawn = room_speed * 1.5;
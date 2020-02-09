event_inherited();

// Set current HP
hp_current = hp_max;
is_invulnerable = false;
dmg_invulnerability = false;

// Movement params;
is_moving = false;
move_spd_x = 0;
move_spd_y = 0;
move_spd_current = 0;

// Sounds
counter_snd_step = 0;
timer_snd_step = room_speed * snd_step_time;

// Jump
is_jumping = false;
counter_jump = 0;
timer_jump = room_speed * 0.25;
counter_air = 0;
timer_air = room_speed * 0.25;
bounce_coef = 0;
jump_spd = 0;
jump_spd_acceleration = 0;
jump_spd_friction = 0;
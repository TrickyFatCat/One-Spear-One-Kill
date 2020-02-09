event_inherited();

// Spear states
enum spear_state {
	ready,
	fly,
	dropped,
	taking
}

state_current = spear_state.ready;

// Visuals
is_sorting = false;

// Spear power
power_current = 0;

// Spear movement
move_spd_current = 0;
move_spd_x = 0;
move_spd_y = 0;
spear_fly_direction = 0;
counter_taking = 0;
timer_taking = room_speed * 0.15;
initial_x = x;
initial_y = y;

// Spear cast
counter_cast = 0;
timer_cast = room_speed * 1;

// Spear damage
dmg_current = dmg_min;

// Spear pierce
pierce_counter = 0;
pierce_friction = 0.5;

// Spear shift
spear_shift_current = 0;
spear_shift_max = 8;

// Sounds
snd_power_max = false;
snd_throw_play = false;
snd_dropped = false;
snd_nospear = false;

// Gravity
counter_air = 0;
timer_air = room_speed * 0.25;
initial_z = 0;
z_max = 10;
/// @description
global.timefactor = 1;

randomize();

// Points and combo
global.points = 0;
global.combo = 0;
global.save_combo = false;
global.counter_combo = 0;
global.timer_combo = room_speed * 4;
global.best_combo = 0;
global.kills_counter = 0;

// Game states
enum game_state {
	idle,
	start,
	active,
	finish
}

state_current = game_state.idle;

// Timers
counter_start = 0;
timer_start = room_speed * 5;
global.game_time = 0;
timer_diffivculty[0] = room_speed * 10;
timer_diffivculty[1] = room_speed * 20;
timer_diffivculty[2] = room_speed * 30;
timer_diffivculty[3] = room_speed * 40;
timer_diffivculty[4] = room_speed * 50;
timer_diffivculty[5] = room_speed * 60;
timer_diffivculty[6] = room_speed * 70;
timer_diffivculty[7] = room_speed * 80;
timer_diffivculty[8] = room_speed * 90;

// Difficulty
global.difficulty_lvl = 0;

// Set controls
init_controls = false;
scr_player_controls();
init_controls = !init_controls;

// Spawn player
instance_create_layer(room_width / 2, room_height / 2, "entities", obj_player)

// Sounds
counter_sound_starttimer = room_speed * 1;
timer_sound_starttimer = room_speed * 1;
enter_battle = false;
audio_group_load(ag_sounds_game);
audio_group_load(ag_sounds_ui);
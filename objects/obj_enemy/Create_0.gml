event_inherited();

is_damaged = false;
is_spawned = true;
draw_alpha = 0;

// Set target params
target_x = 0;
target_y = 0;

// Set shadow
scr_set_shadow(true, 0, 1);

// Drop list
enum drop_id {
	noone,
	flask_small,
	flask_big
}
spawn_weight_sum = 0;
item_is_chosen = false;
drop_item = noone;

// Set damage
dmg_current = dmg_max;

// Timers
counter_activation = 0;
timer_activation = room_speed * 1;
timer_shoot = room_speed * (1 / rate_of_fire);
counter_shoot = timer_shoot;

// Sounds
snd_shoot = false;
snd_activation = false;
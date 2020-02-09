event_inherited();

scr_set_shadow(true, 0, 1)

z_base = 4;
draw_angle = -25;

// Drop parametrs
is_dropping = false;
drop_t = 0;
drop_spd = 0.01;
initial_x = x;
initial_y = y;
var drop_dir = random(359.99);
var drop_dist = 32;
target_x = initial_x + lengthdir_x(drop_dist, drop_dir);
target_y = initial_y + lengthdir_y(drop_dist, drop_dir);

// Pull parametrs
t = 0;
is_pulling = false;
pull_spd = 3;
pull_step = 1;

// Lifespan
counter_lifespan = 0;
timer_lifespan = room_speed * 5;
lifespan_fade_t = 0;
lifespan_fade_spd = 0.01;
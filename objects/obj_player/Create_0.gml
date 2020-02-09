event_inherited();

#macro do_damage_to_player event_user(0)
#macro player_jump event_user(1)

// Set player shadow
scr_set_shadow(true, 0, 1);

// Add camera
global.camera = instance_create_layer(x, y, layer, obj_camera);

// Add spear
spear_offset_y = 6;
spear = instance_create_layer(x, y, layer, obj_player_spear);

// Pickup magnet
pull_distance = 64;
pickup_list = ds_list_create();

// Timers
counter_dmg_invulnerability = 0;
timer_dmg_invulnerability = room_speed * 1.5;

// Jump
jump_charge_max = 2;
jump_charge_current = 2;
timer_jump = room_speed * 0.4;
timer_air = room_speed * 0.35;
bounce_coef = 0;
dir_current = direction;
jump_spd = 3;
jump_spd_acceleration = 0.175;
jump_spd_friction = 0.3;
snd_jump_played = false;
counter_jump_cd = 0;
timer_jump_cd = room_speed * 4;
jump_invulnerability = false;
counter_jump_invulnerability = 0;
timer_jump_invulnerability = room_speed * 0.6;
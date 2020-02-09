/// @description Camera logic

// Set tardet coordinates
target_x = obj_player.x;
target_y = obj_player.y;

// Set distance and speed
var target_distance = point_distance(x, y, target_x, target_y);
var target_direction = point_direction(x, y, target_x, target_y);
var camera_speed = target_distance * camera_follow_coef;

// Move obj_camera
x += lengthdir_x(camera_speed, target_direction);
y += lengthdir_y(camera_speed, target_direction);

// Clamp camera position
x = clamp(x, cam_w / 2, room_width - cam_w / 2);
y = clamp(y, cam_h / 2, room_height - cam_h / 2);

camera_set_view_pos(cam_viewport, x - camera_player_x, y - camera_player_y);



var shake = power(shake_value, 1) * shake_power;
x += random_range(-shake, shake);
y += random_range(-shake, shake);



if shake_value > 0
	{
		shake_value = max(shake_value - 0.1, 0);
	}
	
if shake_angular_active
	{
		camera_set_view_angle(cam_viewport, random_range(-shake, shake) * 0.5);
	}

// Set view

show_debug_message(string(shake))
	

	

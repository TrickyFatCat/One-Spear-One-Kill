/// @description Camera parametrs

#macro cam_viewport view_camera[0]
#macro cam_x camera_get_view_x(cam_viewport)
#macro cam_y camera_get_view_y(cam_viewport)
#macro cam_w camera_get_view_width(cam_viewport)
#macro cam_h camera_get_view_height(cam_viewport)

camera_follow_coef = 0.075;

camera_player_x = cam_w * 0.5;
camera_player_y = cam_h * 0.5;

// Screen shake
shake_power = 5;
shake_value = 0;
shake_angular_active = true;
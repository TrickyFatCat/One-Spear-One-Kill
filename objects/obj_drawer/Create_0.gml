// Turn off cursor
window_set_cursor(cr_none);

// Create draw list
draw_list = ds_list_create();

// Create surface
var surface_w = camera_get_view_width(cam_viewport);
var surfave_h = camera_get_view_height(cam_viewport);
surface_shadows = surface_create(cam_w, cam_h);
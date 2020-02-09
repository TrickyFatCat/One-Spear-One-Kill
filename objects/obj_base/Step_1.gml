/// Check on screen visibility

if (bbox_right > cam_x) and (bbox_left < cam_x + cam_w) and (bbox_bottom > cam_y) and (bbox_top < cam_y + cam_h) {
	is_onscreen = true;
}
else { 
	is_onscreen = false;
}
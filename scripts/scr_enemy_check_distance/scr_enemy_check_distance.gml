/// @param distance
/// @param next_state

var dist = argument0;
var state = argument1;

target_x = obj_player.x;
target_y = obj_player.y;
if point_distance(x, y, target_x, target_y) > dist {
	state_current = state;
	return true;
}
else {
	return false;
}
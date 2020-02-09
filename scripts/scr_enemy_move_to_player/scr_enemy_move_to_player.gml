/// @param distance
/// @param next_state

var dist = argument0;
var state = argument1;
		
if (!is_moving) {
	is_moving = !is_moving;
}
target_x = obj_player.x;
target_y = obj_player.y;
if point_distance(x, y, target_x, target_y) <= dist {
	state_current = state;
}
/// @param angular_active
/// @param shake_value

var angular = argument0;
var value = argument1;

if round(global.camera.shake_value == 0) {
	global.camera.shake_angular_active = angular;
	global.camera.shake_value = value;
}
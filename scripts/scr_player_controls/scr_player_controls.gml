if obj_game_controller.state_current == game_state.start or obj_game_controller.state_current = game_state.active or (!init_controls) {
	// Movement controls
	key_up = keyboard_check(vk_up) or keyboard_check(ord("W"));
	key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
	key_down = keyboard_check(vk_down) or keyboard_check(ord("S"));
	key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_space);

	// Shooting controls
	LMB_pressed = mouse_check_button(mb_left);
}

// UI Controls
key_start = keyboard_check(vk_space) or keyboard_check(vk_enter);
key_finish = keyboard_check(vk_escape);
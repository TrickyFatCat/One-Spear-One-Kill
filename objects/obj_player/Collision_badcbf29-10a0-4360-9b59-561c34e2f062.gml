if hp_current > 0 {
	do_damage_to_player;
	if (!is_jumping) {
		instance_destroy(other);
	}
}
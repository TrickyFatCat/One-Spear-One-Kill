if hp_current > 0 {
	if (!other.damage_is_done) {
		do_damage_to_player;
		other.damage_is_done = !other.damage_is_done;
	}
}
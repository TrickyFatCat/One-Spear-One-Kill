event_inherited();

// Pull pickups to player
if hp_current > 0 and (!is_jumping) {
	collision_circle_list(x, y, pull_distance, obj_pickup, true, true, pickup_list, true);
	if (!ds_list_empty(pickup_list)) {
		for (var i = 0; i < ds_list_size(pickup_list); i++) {
			var o_pickup = pickup_list[| i];
			with o_pickup {
				if (!is_pulling) {
					t = 0;
					pull_step = other.pull_distance / 2;
					is_pulling = !is_pulling;
				}
				else {
					var pickup_id = ds_list_find_index(obj_player.pickup_list, id);
					ds_list_delete(obj_player.pickup_list, pickup_id);
				}
			}
		}
	}
}

// Damage invulnerability
if (dmg_invulnerability) {
	counter_dmg_invulnerability = approach(counter_dmg_invulnerability, timer_dmg_invulnerability, global.timefactor);
	if counter_dmg_invulnerability < timer_dmg_invulnerability {
		scr_set_flash(c_red, 1.5);
	}
	else {
		is_invulnerable = false;
		dmg_invulnerability = false;
	}
}

// Jump invulnerability
if (jump_invulnerability) {
	counter_jump_invulnerability = approach(counter_jump_invulnerability, timer_jump_invulnerability, global.timefactor);
	if counter_jump_invulnerability < timer_jump_invulnerability {
		scr_set_flash(c_lime, 1.5);
	}
	else {
		is_invulnerable = false;
		jump_invulnerability = false;
	}
}
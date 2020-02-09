// Lifespan logic
if counter_lifespan < timer_lifespan {
	counter_lifespan = min(counter_lifespan + global.timefactor, timer_lifespan);
	if counter_lifespan / timer_lifespan > 0.75 {
		scr_set_flash(c_white, 2);
	}
}
else {
	if draw_alpha != 0 {
		lifespan_fade_t += lifespan_fade_spd;
		draw_alpha = lerp(draw_alpha, 0, lifespan_fade_t);
		shadow_alpha = lerp(shadow_alpha, 0, lifespan_fade_t);
	}
	else {
		instance_destroy();
	}
}
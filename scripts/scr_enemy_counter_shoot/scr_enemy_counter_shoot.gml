if counter_shoot < timer_shoot {
	counter_shoot = min(counter_shoot + global.timefactor, timer_shoot);
	return true;
}
else {
	return false;
}
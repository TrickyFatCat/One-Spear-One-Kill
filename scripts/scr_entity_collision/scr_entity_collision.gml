var target = argument0;

// Collision X
if (place_meeting(x + move_spd_x,y,target))
	{
		while (!place_meeting(x + sign(move_spd_x),y,target))
			{
				x += sign(move_spd_x);
			}
		move_spd_x = 0;
	}

// Collision Y
if (place_meeting(x,y + move_spd_y,target))
	{
		while (!place_meeting(x,y + sign(move_spd_y),target))
			{
				y += sign(move_spd_y);
			}
		move_spd_y = 0;
	}
/// @description doublepress_step( );
/// @param max time 

///---		Example		---///
/*	
	//	Create
	doublepress_create( room_speed* 0.2 );
	
	//	Step
	var dKey	= doublepress_step();
	if ( dKey == vk_space ){ //
		//trigger code
	}
	
	//////////////////////////
	If space is pressed twice within 0.2 seconds, trigger the event.

*/

if ( keyboard_check_pressed( vk_anykey )){ //double click
	prevKey[ 1 ]	= prevKey[ 0 ];
	prevKey[ 0 ]	= keyboard_lastkey;
	prevKeyTimer = 0;
}

if ( prevKeyTimer < prevKeyTimerMax ){
	prevKeyTimer++;
	if ( prevKey[ 0 ] == prevKey[ 1 ] )
		DoubleKey = prevKey[ 0 ];
} else {
	DoubleKey		= -1;
	prevKey[ 0 ]	= -1;
	prevKey[ 1 ]	= -1;
}

return DoubleKey;

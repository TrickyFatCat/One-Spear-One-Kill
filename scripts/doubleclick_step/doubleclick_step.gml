/// @description doubleclick_step( );

///---		Example		---///
/*	
	//	Create
	doubleclick_create( room_speed* 0.2 );
	
	//	Step
	var dKey	= doubleclick_step();
	if ( dKey == mb_left ){ //
		//trigger code
	}
	
	//////////////////////////
	If the Left mouse button is pressed twice within 0.2 seconds, trigger the event.

*/

if ( mouse_check_button_pressed( mb_any )){ //double click
	prevMouse[ 1 ]	= prevMouse[ 0 ];
	prevMouse[ 0 ]	= mouse_lastbutton;
	prevMouseTimer = 0;
}

if ( prevMouseTimer < prevMouseTimerMax ){
	prevMouseTimer++;
	if ( prevMouse[ 0 ] == prevMouse[ 1 ] )
		DoubleMouse = prevMouse[ 0 ];
} else {
	DoubleMouse		= -1;
	prevMouse[ 0 ]	= -1;
	prevMouse[ 1 ]	= -1;
}

return DoubleMouse;

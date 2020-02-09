/// @description doubleclick_create( max time );
/// @param max time 

///---		Example		---///
/*	//Create
	doubleclick_create( room_speed* 0.2 );
	
	//////////////////////////
	Double tap a keyboard key within 0.2 seconds to trigger the event (inside step event)

*/

prevMouse[ 2 ]	= 0;
prevMouseTimer	= 0;
prevMouseTimerMax = argument0; //double tap within this time
DoubleMouse		= -1; 

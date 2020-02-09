/// @description draw_grid( left, top, right, down, color, alpha, tileSize, lineWidth );
/// @param left
/// @param top
/// @param right
/// @param down
/// @param color
/// @param alpha
/// @param tileSize
/// @param lineWidth

///	-----------------EXAMPLE-------------------///
/*

	/// Alarm[0]
	surface_set_target( surf );
	surface_clear_alpha( 0,0 );
	draw_grid( 0,0, room_width, room_height, c_white, 1, 32, 2 );
	surface_reset_target();
	
	//////////////////////////////////////////////////////////
	Draws a 32x32 grid the size of the room to a surface. The lines are 2 pixels thick. 
	
*/


var _left       = argument0
var _top        = argument1;
var _right      = argument2;
var _down       = argument3;
var _col        = argument4;
var _alpha      = argument5;
var _tileSize   = argument6;
var _lineW      = argument7;


draw_set_color( _col );
draw_set_alpha( _alpha );

// Horizontal Lines
for(var h=0; h<(_down/_tileSize)+1; h++){
    draw_line_width( _left, h* _tileSize, _right, h* _tileSize, _lineW );
}
// Vertical Lines
for(var v=0; v<(_right/_tileSize)+1; v++){
    draw_line_width( _tileSize* v, _top, _tileSize* v, _down, _lineW );
}

draw_set_color( c_white );
draw_set_alpha( 1 );

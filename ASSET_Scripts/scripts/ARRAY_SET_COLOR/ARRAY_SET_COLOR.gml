// Set Color Script
/// @description ARRAY_SET_COLOR
/// @param type num
/// @param BLEND array
/// @param ALPHA array
/// @param COLOR array

///	-----------------EXAMPLE-------------------///
/*

*/


var n			= argument0;
var _BLEND		= argument1;
var _ALPHA		= argument2;
var _COLOR		= argument3;

if ( !part_type_exists( global.partType[ n ] )){
	global.partType[ n ]	= part_type_create();	
}

// COLOR
part_type_blend(	global.partType[ n ], _BLEND );
part_type_alpha3(	global.partType[ n ], _ALPHA[0], _ALPHA[1], _ALPHA[2] );
part_type_color3(	global.partType[ n ], _COLOR[0], _COLOR[1], _COLOR[2] );
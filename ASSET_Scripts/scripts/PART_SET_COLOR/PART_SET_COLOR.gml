/// Set all color arrays & values inside the script
/// @description ARRAY_SET_COLOR
/// @param type num
/// @param BLEND array
/// @param ALPHA array
/// @param COLOR array
/// @param blend
/// @param alpha1
/// @param alpha2
/// @param alpha3
/// @param color1
/// @param color2
/// @param color3


// Temp Arrays
var n	   = argument0;
var _BLEND = argument1; // temp arrays
var _ALPHA = argument2;
var _COLOR = argument3;
var b0			= argument4;
var a0			= argument5;
var a1			= argument6;
var a2			= argument7;
var c0			= argument8;
var c1			= argument9;
var c2			= argument10;


// Set arrays inside script
_BLEND[@ n ]		= b0; //blend
_ALPHA[@ n, 0 ]		= a0; //alpha
_ALPHA[@n, 1 ]		= a1;
_ALPHA[@n, 2 ]		= a2;
_COLOR[@n, 0 ]		= c0; //color
_COLOR[@n, 1 ]		= c1;
_COLOR[@n, 2 ]		= c2;



// Create Part Type
if ( !part_type_exists( global.partType[ n ] )){
	global.partType[ n ]	= part_type_create();	
}

// Set Particle Type values 
part_type_blend(	global.partType[ n ], b0 );
part_type_alpha3(	global.partType[ n ], a0, a1, a2 );
part_type_color3(	global.partType[ n ], c0, c1, c2 );

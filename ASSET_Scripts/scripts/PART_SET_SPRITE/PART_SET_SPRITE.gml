//Set Sprite Script
/// @description PART_SET_SPRITE( );
/// @param type num
/// @param SPRITE array
/// @param SCALE array
/// @param SIZE array
/// @param sprite
/// @param animate
/// @param stretch
/// @param random
/// @param xscale
/// @param yscale
/// @param size_min
/// @param size_max 
/// @param size_inc
/// @param size_wigg



var n			= argument0; //part type
var _SPRITE		= argument1; //temp arrays
var _SCALE		= argument2;
var _SIZE		= argument3;
var spr0			= argument4; //sprite
var spr1			= argument5;
var spr2			= argument6;
var spr3			= argument7;
var sca0			= argument8; //scale
var sca1			= argument9;
var size0			= argument10;//size
var size1			= argument11;
var size2			= argument12;
var size3			= argument13;


// Save temp data into an array
_SPRITE[@n, 0]		= spr0;	 //sprite
_SPRITE[@n, 1]		= spr1; //animate
_SPRITE[@n, 2]		= spr2;  //stretch
_SPRITE[@n, 3]		= spr3; //random
//----------------------
_SCALE[@n, 0]		= sca0; //xscale
_SCALE[@n, 1]		= sca1; //yscale
//----------------------
_SIZE[@n, 0]		= size0; //min
_SIZE[@n, 1]		= size1; //max
_SIZE[@n, 2]		= size2; //inc
_SIZE[@n, 3]		= size3; //wigg

/// Create particle type
if ( !part_type_exists( global.partType[ n ] )){
	global.partType[ n ]	= part_type_create();	
}

// Set values into the Particle Type
part_type_sprite(	global.partType[ n ], spr0, spr1, spr2, spr3 );
part_type_scale(	global.partType[ n ], sca0, sca1 );
part_type_size(		global.partType[ n ], size0, size1, size2, size3 );

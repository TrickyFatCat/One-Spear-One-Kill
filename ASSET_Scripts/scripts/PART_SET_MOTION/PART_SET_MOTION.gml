//Set Motion Script
/// @description PART_SET_MOTION
/// @param type num
/// @param SPEED array
/// @param DIRECTION array
/// @param ORIENTATION array
/// @param GRAVITY array
/// @param speed_min
/// @param speed_max 
/// @param speed_inc
/// @param speed_wigg
/// @param dir_min
/// @param dir_max
/// @param dir_inc
/// @param dir_wigg
/// @param or_min
/// @param or_max
/// @param or_inc
/// @param or_wigg
/// @param or_relative
/// @param grav_amount
/// @param grav_dir


// Temp arrays
var n				= argument[0];
var _SPD			= argument[1];
var _DIRECTION		= argument[2];
var _ORIENTATION	= argument[3];
var _GRAVITY		= argument[4];
var s0		= argument[5];
var s1		= argument[6];
var s2		= argument[7];
var s3		= argument[8];
var d0		= argument[9];
var d1		= argument[10];
var d2		= argument[11];
var d3		= argument[12];
var o0		= argument[13];
var o1		= argument[14];
var o2		= argument[15];
var o3		= argument[16];
var o4		= argument[17];
var g0		= argument[18];
var g1		= argument[19];


//	Save values to array
_SPD[@n, 0 ]		= s0; //min
_SPD[@n, 1 ]		= s1; //max
_SPD[@n, 2 ]		= s2; //inc
_SPD[@n, 3 ]		= s3; //wig
//--------------------------
_DIRECTION[@n, 0 ]		= d0; //min
_DIRECTION[@n, 1 ]		= d1; //max
_DIRECTION[@n, 2 ]		= d2; //inc
_DIRECTION[@n, 3 ]		= d3; //wigg
//-------------------------
_ORIENTATION[@n, 0 ]			= o0; //min
_ORIENTATION[@n, 1 ]			= o1; //max
_ORIENTATION[@n, 2 ]			= o2; //inc
_ORIENTATION[@n, 3 ]			= o3; //wigg
_ORIENTATION[@n, 4 ]			= o4; //rel
//------------------------
_GRAVITY[@n, 0 ]	= g0; //amount
_GRAVITY[@n, 1 ]	= g1; //dir


// Create Particle Types
if ( !part_type_exists( global.partType[ n ] )){
	global.partType[ n ]	= part_type_create();	
}

// Set Particle Types 
part_type_speed(		global.partType[ n ], s0, s1, s2, s3 );
part_type_direction(	global.partType[ n ], d0, d1, d2, d3 );
part_type_orientation(	global.partType[ n ], o0, o1, o2, o3, o4 );
part_type_gravity(		global.partType[ n ], g0, g1 );


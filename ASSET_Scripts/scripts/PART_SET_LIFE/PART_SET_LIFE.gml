//Set Life Script
/// @description PART_SET_LIFE( );
/// @param type num
/// @param STEP array
/// @param DEATH array
/// @param LIFE array
/// @param step_num
/// @param step_type
/// @param death_num
/// @param death_type
/// @param life_min
/// @param life_max

// Set temp arrays
var n			= argument0;
var _STEP		= argument1;
var _DEATH		= argument2;
var _LIFE		= argument3;
var s0			= argument4;
var s1			= argument5;
var d0			= argument6;
var d1			= argument7;
var l0			= argument8;
var l1			= argument9;


// Set values into an array
//You can set a negative value to the emitter number. -3 has a 1:3 chance of emitting a particle.
_STEP[0]		= s0;
_STEP[1]		= s1;
_DEATH[0]		= d0;
_DEATH[1]		= d1;
_LIFE[0]		= l0;
_LIFE[1]		= l1;



// Create particle type
if ( !part_type_exists( global.partType[ n ] )){
	global.partType[ n ]	= part_type_create();	
}

// Set Particle 
part_type_step(		global.partType[ n ], s0, s1 );
part_type_death(	global.partType[ n ], d0, d1 );
part_type_life(		global.partType[ n ], l0, l1 );

/// @description part_burst( system, type, x,y, amount, dir, spread );
/// @param system
/// @param type
/// @param x
/// @param y
/// @param amount
/// @param dir
/// @param spread


var _sys	= argument0;
var _type	= argument1;
var _x		= argument2;
var _y		= argument3;
var _amount	= argument4;
var _dir	= argument5;
var _spread	= argument6/2;

part_type_direction( global.partType[ _type ], _dir-_spread, _dir+_spread, 0,0 );
part_particles_create( global.partSystem[ _sys ], _x,_y, global.partType[ _type ], _amount );

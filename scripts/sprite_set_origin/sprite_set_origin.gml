/// @description sprite_set_origin( sprite, u, v );
/// @param sprite
/// @param u
/// @param v

// Adjust a sprite's origin points

///	------------|				EXAMPLE				 |-------------- ///
//  sprite_set_origin( sprite_index, 0.5, 0.5 );

///////////////////////////////////////////////
//  This centers the sprite's origin.


var _sprite	= argument0;
var _u		= argument1;
var _v		= argument2;

var _xorigin = sprite_get_width(_sprite)* _u;
var _yorigin = sprite_get_height(_sprite)* _v;

sprite_set_offset( _sprite, _xorigin, _yorigin );
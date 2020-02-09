/// @description random_index( sprite );
/// @param sprite

// Returns a random index from the specified sprite_index

///	-----------------EXAMPLE-------------------///
/*
	// Create
	image_index = random_index( sprite_index );
	
*/

var _count = sprite_get_number( argument0 );
return irandom( _count-1 );
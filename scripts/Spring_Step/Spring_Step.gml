/// @description Spring_Step( num );
/// @param num

///	-----------------EXAMPLE-------------------///
/*
	// Step
	Spring_Step( 0 );
*/

var n		= argument0;

var Displacement = ( sset[ n ]- sval[ n ] );
sspd[ n ] += ( sten[ n ]* Displacement )- ( sdamp[ n ]* sspd[ n ] );
sval[ n ] += sspd[ n ];

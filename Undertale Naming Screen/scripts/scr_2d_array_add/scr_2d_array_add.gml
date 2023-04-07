/// @description scr_2d_array_add(array,value,...);
/// @param array
/// @param value
/// @param ...
function scr_2d_array_add() {
	//
	// Returns the given array with elements appended to it.
	// If an array is not given, create an array with elements appended to it.
	//
	// Note: GM:Studio has a 16 argument limit.
	//
	// GMLscripts.com/license
	//
	// This script is a modified version of GMLscripts.com's script

	// taken_name = scr_2d_array_add(taken_name, 'fryman', "Hey! That's my name!");

	var r, o, a, i;
	r = argument[0];
	if !is_array(r) {
	    r[0, 0] = noone;
	    o = 0;
	} else o = array_height_2d(r);
	a = argument_count;
	// show_message(string(a));
	for(i = 0; i < a - 1; i++) {
	    r[@ o, i] = argument[i + 1];
	}
	return r;



}

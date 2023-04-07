/// @description scr_string_backspace(string);
/// @param string
function scr_string_backspace() {
	//
	// Remove the last character in a string
	var s = argument[0];
	if string_length(s) > 0 {
	    s = string_delete(s, string_length(s), 1);
	}
	return s;



}

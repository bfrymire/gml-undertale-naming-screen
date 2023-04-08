/**
 * @function string_backspace
 * @param {String} _str
 * @returns {String}
 */
function string_backspace(_str) {
	if !is_string(_str) {
		throw(string("string_backspace() \"str\" expected a string, received {0}.", typeof(_str)));
	}
	var _len = string_length(_str);
	if _len <= 1 {
		return "";
	}
	return string_copy(_str, 1, _len - 1);
}

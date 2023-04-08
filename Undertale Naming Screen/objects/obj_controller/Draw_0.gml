// set font
draw_set_font(fnt_dtm_sans);

// set variables
var _draw_y = 0;
var _character_width = string_width("W");
var _character_height = string_height("W");
var _spacing_width = 48;
var _spacing_height = 0;
var _ascii_x = floor((room_width * 0.5) - ((_spacing_width * max_string + _character_width * 7) * 0.5)) + 1;

// draw title
draw_set_color(string_color);
draw_set_halign(fa_center);
_draw_y += 32;
draw_text_ext(room_width * 0.5, _draw_y, header_text, -1, _spacing_width * 6);

// draw typed name
draw_set_valign(fa_middle);
_draw_y += _character_height + 10;
draw_text_transformed(floor(room_width * 0.5) + 1, _draw_y + (_character_height* 0.5), current_string, 1 + (4 * name_index), 1 + (4 * name_index), 0);

// resetting the aligns
draw_set_halign(fa_left);
draw_set_valign(fa_top);

switch (name_state) {
	case NAME_STATES.INPUT_NAME:
		// drawing ascii_characters
		_draw_y += _character_height + 10;
		for(var j = array_length(ascii_characters) - 2; j > -1; j--) {
			for(var i = array_length(ascii_characters[j]) - 1; i > -1; i--) {
				// change color if currently selected index
				if j == string_position_y && i == string_position_x {
					draw_set_color(string_highlight_color);
				} else {
					draw_set_color(string_color);
				}
				var _x = _ascii_x + ((_character_width + _spacing_width) * i) - string_wobble + floor(random(string_wobble * 2));
				var _y = _draw_y + ((_character_height + _spacing_height) * j) - string_wobble + floor(random(string_wobble * 2));
				draw_text(_x, _y, ascii_characters[j][i]);
			}
		}
		// draw last line of ascii_characters
		j = array_length(ascii_characters) - 1;
		var _last_y = _draw_y + ((_character_height + _spacing_height) * j) + 8;
		var _last_line_width = 0;
		for(var i = 0; i < array_length(ascii_characters[j]); ++i) {
			// change color if currently selected index
			if i == string_position_x && j == string_position_y {
				draw_set_color(string_highlight_color);
			} else {
				draw_set_color(string_color);
			}
			draw_text(_ascii_x + _last_line_width + (_spacing_width * i), _last_y, ascii_characters[j][i]);
			_last_line_width += string_width(ascii_characters[j][i]);
		}
		break;
	case NAME_STATES.PRE_CONFIRMATION:
		// Draw nothing
		break;
	case NAME_STATES.CONFIRMATION:
		// 'Confirmation' screen
		if is_name_taken {
			draw_set_color(string_highlight_color);
			draw_text(10, 64, "Go back"); // edit this later to place correctly on screen
			// reset draw color
			draw_set_color(string_color);
		} else {
			for(var i = 0; i < array_length(confirmation_text); ++i) {
				if i == confirmation_index {
					draw_set_color(string_highlight_color);
				}
				// edit this later to place correctly on screen
				draw_text(10 + i * 64, 64, confirmation_text[i]);
				// reset draw color
				draw_set_color(string_color);
			}
		}
		break;
	default:
		show_debug_message(string("Unknown name state: {0}", name_state));
		break;
}

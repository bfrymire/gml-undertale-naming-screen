enum NAME_STATES {
    INPUT_NAME,
    PRE_CONFIRMATION,
    CONFIRMATION,
    __SIZE
}

event_user(15);

// Turn off anti-aliasing filtering
display_reset(0, false);
gpu_set_texfilter(false);

// Current string the player inputs
current_string = "";
string_position_x = 0;
string_position_y = 0;
string_color = c_white;
// The original highlighted color is yellow;
// However, it's very difficult to see
// String_highlight_color = c_yellow;
string_highlight_color = c_aqua;

// Max number of characters the player is able to input
max_string = 6;

// Number of pixels the string can wobble when being drawn
string_wobble = 1;

name_state = NAME_STATES.INPUT_NAME;
name_index = 0;

header_text = "Name the fallen human.";


// Create a list of names that already exist
is_name_taken = false;
name_taken_index = noone;
taken_names = [];
add_take_names();
add_taken_names();

// Adding A-Z
var _w = 0;
var _max_w = 6;
var _h = 0;
for(var i = 65; i <= 90; ++i) {
    ascii_characters[_h][_w] = chr(i);
    _w++;
    if _w > _max_w {
        _h++;
        _w = 0;
    }
}
// Adding a-z
_w = 0;
_h = array_length(ascii_characters);
for(var i = 97; i <= 122; ++i) {
    ascii_characters[_h][_w] = chr(i);
    _w++;
    if _w > _max_w {
        _h++;
        _w = 0;
    }
}
// Adding 'Quit', 'Backspace', 'Done'
_h = array_length(ascii_characters);
ascii_characters[_h] = [
    "Quit",
    "Backspace",
    "Done"
];

// Confirmation page text
confirmation_text = [
    "No",
    "Yes"
];
confirmation_index = 1;

confirmation_buttons = [
    vk_enter,
    vk_space
];

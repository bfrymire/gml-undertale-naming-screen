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

// My Name!
add_name("Brent", "Hey! Thats my name!", true);

// Forbidden Names (Not allowed)
add_name("Alphys", "D-don't do that.", true);
add_name("Asgore", "You cannot.", true);
add_name("Asriel", "...", true);
add_name("Flowey", "I already CHOSE that name.", true);
add_name("Sans", "nope", true);
add_name("Toriel", "I think you should think of your own name, my child.", true);
add_name("Undyne", "Get your OWN name!", true);
add_name("Gaster", "[Instantly reload the intro sequence.]", true);

// Custom Responses (Allowed)
add_name("Frisk", "WARNING: This name will make your life hell. Proceed anyway?");
add_name("Murder", "That's a little on-the-nose, isn't it...?");
add_name("Mercy", "That's a little on-the-nose, isn't it...?");
add_name("Catty", "Bratty! Bratty! That's MY name!");
add_name("Bratty", "Like, OK I guess.");
add_name("Temmie", "hOI!");
add_name("Aaron", "Is this name correct? ;)");
add_name("Woshua", "Clean name.");
add_name("Chara", "The true name.");
add_name("AAAAAA", "Not very creative...?");
add_name("Metta", "OOOOH!!! ARE YOU PROMOTING MY BRAND?");
add_name("Mett", "OOOOH!!! ARE YOU PROMOTING MY BRAND?");
add_name("Mtt", "OOOOH!!! ARE YOU PROMOTING MY BRAND?");
add_name("Jerry", "Jerry.");
add_name("Papyru", "I'LL ALLOW IT!!!!");
add_name("Alphy", "Uh.... OK?");
add_name("Napsta", "............ (They are powerless to stop you.)");
add_name("Blooky", "............ (They are powerless to stop you.)");
add_name("Bpants", "You are really scraping the bottom of the barrel.");
add_name("Gerson", "Wah ha ha! Why not?");
add_name("Shyren", "...?");

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

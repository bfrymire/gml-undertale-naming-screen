// turn off anti-aliasing filtering
display_reset(0, false);
gpu_set_texfilter(false);

// current string the player inputs
current_string = "";
string_position_x = 0;
string_position_y = 0;
string_color = c_white;
// The original highlighted color is yellow;
// However, it's very difficult to see
// string_highlight_color = c_yellow;
string_highlight_color = c_aqua;

// max number of characters the player is able to input
max_string = 6;

// number of pixels the string can wobble when being drawn
string_wobble = 1;

name_state = "Choosing_Name"; // can only be 'Choosing_Name' or 'Confirmation'
name_index = 0;

// Create a list of names that already exist
header_text = "Name the fallen human.";
is_taken_name = false;
taken_name_index = noone;
taken_name = noone; // this is necessary, variable needs to be defined
// taken_name = scr_2d_array_add(taken_name, name, message, is_forbidden);
// My Name!
taken_name = scr_2d_array_add(taken_name, "fryman", "Hey! Thats my name!", true);
// Forbidden Names (Not allowed)
taken_name = scr_2d_array_add(taken_name, "Alphys", "D-don't do that.", true);
taken_name = scr_2d_array_add(taken_name, "Asgore", "You cannot.", true);
taken_name = scr_2d_array_add(taken_name, "Asriel", "...", true);
taken_name = scr_2d_array_add(taken_name, "Flowey", "I already CHOSE that name.", true);
taken_name = scr_2d_array_add(taken_name, "Sans", "nope", true);
taken_name = scr_2d_array_add(taken_name, "Toriel", "I think you should think of your own name, my child.", true);
taken_name = scr_2d_array_add(taken_name, "Undyne", "Get your OWN name!", true);
taken_name = scr_2d_array_add(taken_name, "Gaster", "[Instantly reload the intro sequence.]", true);
// Custom Responses (Allowed)
taken_name = scr_2d_array_add(taken_name, "Frisk", "WARNING: This name will make your life hell. Proceed anyway?", false);
taken_name = scr_2d_array_add(taken_name, "Murder", "That's a little on-the-nose, isn't it...?", false);
taken_name = scr_2d_array_add(taken_name, "Mercy", "That's a little on-the-nose, isn't it...?", false);
taken_name = scr_2d_array_add(taken_name, "Catty", "Bratty! Bratty! That's MY name!", false);
taken_name = scr_2d_array_add(taken_name, "Bratty", "Like, OK I guess.", false);
taken_name = scr_2d_array_add(taken_name, "Temmie", "hOI!", false);
taken_name = scr_2d_array_add(taken_name, "Aaron", "Is this name correct? ;)", false);
taken_name = scr_2d_array_add(taken_name, "Woshua", "Clean name.", false);
taken_name = scr_2d_array_add(taken_name, "Chara", "The true name.", false);
taken_name = scr_2d_array_add(taken_name, "AAAAAA", "Not very creative...?", false);
taken_name = scr_2d_array_add(taken_name, "Metta", "OOOOH!!! ARE YOU PROMOTING MY BRAND?", false);
taken_name = scr_2d_array_add(taken_name, "Mett", "OOOOH!!! ARE YOU PROMOTING MY BRAND?", false);
taken_name = scr_2d_array_add(taken_name, "Mtt", "OOOOH!!! ARE YOU PROMOTING MY BRAND?", false);
taken_name = scr_2d_array_add(taken_name, "Jerry", "Jerry.", false);
taken_name = scr_2d_array_add(taken_name, "Papyru", "I'LL ALLOW IT!!!!", false);
taken_name = scr_2d_array_add(taken_name, "Alphy", "Uh.... OK?", false);
taken_name = scr_2d_array_add(taken_name, "Napsta", "............ (They are powerless to stop you.)", false);
taken_name = scr_2d_array_add(taken_name, "Blooky", "............ (They are powerless to stop you.)", false);
taken_name = scr_2d_array_add(taken_name, "Bpants", "You are really scraping the bottom of the barrel.", false);
taken_name = scr_2d_array_add(taken_name, "Gerson", "Wah ha ha! Why not?", false);
taken_name = scr_2d_array_add(taken_name, "Shyren", "...?", false);
// adding A-Z
var w, max_w, h;
w = 0;
max_w = 6;
h = 0;
for(var i = 65; i <= 90; i++) {
    ascii_characters[h, w] = chr(i);
    w++;
    if w > max_w {
        h++;
        w = 0;
    }
}
// adding a-z
w = 0;
h = array_height_2d(ascii_characters);
for(var i = 97; i <= 122; i++) {
    ascii_characters[h, w] = chr(i);
    w++;
    if w > max_w {
        h++;
        w = 0;
    }
}
// adding 'Quit', 'Backspace', 'Done'
h = array_height_2d(ascii_characters);
ascii_characters[h, 0] = "Quit";
ascii_characters[h, 1] = "Backspace";
ascii_characters[h, 2] = "Done";

// confirmation page text
confirmation_text[0] = "No";
confirmation_text[1] = "Yes";
confirmation_index = 1;

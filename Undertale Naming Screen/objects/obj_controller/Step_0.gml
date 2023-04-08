// Testing
if keyboard_check(vk_control) {
    if keyboard_check_pressed(ord("W")) {
        game_end();
    }
    if keyboard_check_pressed(ord("R")) {
        game_restart();
    }
}

// Picking your character's name page
switch (name_state) {
    case NAME_STATES.INPUT_NAME:
        name_index = 0; // Reset name_index to 0
        if keyboard_check_pressed(vk_left) {
            if string_position_x != 0 {
                string_position_x -=1;
            }
        }
        if keyboard_check_pressed(vk_right) {
            if string_position_x != array_length(ascii_characters[string_position_y]) - 1 {
                string_position_x += 1;
            }
        }
        if keyboard_check_pressed(vk_up) {
            if string_position_y != 0 {
                string_position_y -= 1;
                if string_position_x > array_length(ascii_characters[string_position_y]) - 1 {
                    string_position_x = array_length(ascii_characters[string_position_y]) - 1;
                }
            }
        }
        if keyboard_check_pressed(vk_down) {
            if string_position_y != array_length(ascii_characters) - 1 {
                string_position_y += 1;
                if string_position_y {
                    /////////// THIS NEEDS TO BE FINISHED ^^^^^^^^
                }
                if string_position_x > array_length(ascii_characters[string_position_y]) - 1 {
                    string_position_x = array_length(ascii_characters[string_position_y]) - 1;
                }
            }
        }
        
        if keyboard_check_pressed(vk_backspace) {
            current_string = string_backspace(current_string);
        }
        
        if confirmation_button_pressed() {
            if string_position_y != array_length(ascii_characters) - 1 {
                if string_length(current_string) < max_string {
                    current_string += ascii_characters[string_position_y, string_position_x];
                    // If your name is the max length, move to "Done"
                    if string_length(current_string) == max_string {
                        string_position_x = 2;
                        string_position_y = array_length(ascii_characters) - 1;
                    }
                }
            } else {
                if string_position_x == 0 {
                    room_goto_previous(); // Remove for your game
                    // Quit code goes here
                } else if string_position_x == 1 {
                    current_string = string_backspace(current_string);
                } else {
                    if string_length(current_string) > 0 {
                        name_state = NAME_STATES.PRE_CONFIRMATION;
                    }
                }
            }
        }
        
        // Manual keyboard strokes
        if keyboard_lastkey != noone {
            if keyboard_lastkey == clamp(keyboard_lastkey, 65, 90) || keyboard_lastkey == clamp(keyboard_lastkey, 97, 122) {
                if string_length(current_string) < max_string {
                    current_string += keyboard_lastchar;
                    // If your name is the max length, move to "Done"
                    if string_length(current_string) == max_string {
                        string_position_x = 2;
                        string_position_y = array_length(ascii_characters) - 1;
                    }
                }
            }
            keyboard_lastkey = noone;
        }
        break;
    case NAME_STATES.PRE_CONFIRMATION:
        is_name_taken = false;
        for(var i = 0; i < array_length(taken_names); ++i) {
            var _name = taken_names[i];
            // Names are not case sensitive
            if string_lower(_name.name) == string_lower(current_string) {
                header_text = _name.message;
                is_name_taken = _name.is_forbidden;
                name_taken_index = i;
                break;
            }
        }
        name_state = NAME_STATES.CONFIRMATION;
        break;
    case NAME_STATES.CONFIRMATION:
        // Name confirmation page
        if name_index < 1 {
            name_index += 0.25 / room_speed; // 0 to 1 in 4 seconds;
            if name_index > 1 {
                name_index = 1;
            }
        }
        if !is_name_taken {
              if keyboard_check_pressed(vk_left) {
                confirmation_index -= 1;
              }
              if keyboard_check_pressed(vk_right) {
                confirmation_index += 1;
              }
              if confirmation_index != clamp(confirmation_index, 0, array_length(confirmation_text) - 1) {
                confirmation_index = clamp(confirmation_index, 0, array_length(confirmation_text) - 1);
              }
        }
        if confirmation_button_pressed() {
            if is_name_taken {
                confirmation_index = 0;
            }
            if confirmation_index == 0 { // No
                confirmation_index = 1;
                name_state = NAME_STATES.INPUT_NAME;
                header_text = "Name the fallen human.";
            } else if confirmation_index == 1 { // Yes
                // Replace the following code with how you'll accept the Player's name
                show_message("Save the <current_string> variable as the Player's name.");
                name_state = NAME_STATES.INPUT_NAME;
                header_text = "Name the fallen human.";
            }
        }
        break;
    default:
        show_debug_message(string("Unknown name state: {0}", name_state));
        break;
}

// testing
if keyboard_check(vk_control) {
    if keyboard_check_pressed(ord("W")) {
        game_end();
    }
    if keyboard_check_pressed(ord("R")) {
        game_restart();
    }
}

// picking your character's name page
if name_state = "Choosing_Name" {
    name_index = 0; // reset name_index to 0
    if keyboard_check_pressed(vk_left) {
        if string_position_x != 0 {
            string_position_x -=1;
        }
    }
    if keyboard_check_pressed(vk_right) {
        if string_position_x != array_length_2d(ascii_characters, string_position_y) - 1 {
            string_position_x += 1;
        }
    }
    if keyboard_check_pressed(vk_up) {
        if string_position_y != 0 {
            string_position_y -= 1;
            if string_position_x > array_length_2d(ascii_characters, string_position_y) - 1 {
                string_position_x = array_length_2d(ascii_characters, string_position_y) - 1;
            }
        }
    }
    if keyboard_check_pressed(vk_down) {
        if string_position_y != array_height_2d(ascii_characters) - 1 {
            string_position_y += 1;
            if string_position_y {
                /////////// THIS NEEDS TO BE FINISHED ^^^^^^^^
            }
            if string_position_x > array_length_2d(ascii_characters, string_position_y) - 1 {
                string_position_x = array_length_2d(ascii_characters, string_position_y) - 1;
            }
        }
    }
    
    if keyboard_check_pressed(vk_backspace) {
        current_string = scr_string_backspace(current_string);
    }
    
    if keyboard_check_pressed(vk_space) {
        if string_position_y != array_height_2d(ascii_characters) - 1 {
            if string_length(current_string) < max_string {
                current_string += ascii_characters[string_position_y, string_position_x];
                // if your name is the max length, move to "Done"
                if string_length(current_string) == max_string {
                    string_position_x = 2;
                    string_position_y = array_height_2d(ascii_characters) - 1;
                }
            }
        } else {
            if string_position_x == 0 {
                room_goto_previous(); // remove for your game
                // quit code goes here
            } else if string_position_x == 1 {
                current_string = scr_string_backspace(current_string);
            } else {
                if string_length(current_string) > 0 {
                    name_state = "Pre_Confirmation";
                }
            }
        }
    }
    
    // manual keyboard strokes
    if keyboard_lastkey != noone {
        if keyboard_lastkey == clamp(keyboard_lastkey, 65, 90) || keyboard_lastkey == clamp(keyboard_lastkey, 97, 122) {
            if string_length(current_string) < max_string {
                current_string += keyboard_lastchar;
                // if your name is the max length, move to "Done"
                if string_length(current_string) == max_string {
                    string_position_x = 2;
                    string_position_y = array_height_2d(ascii_characters) - 1;
                }
            }
        }
        keyboard_lastkey = noone;
    }
} else{
    if name_state == "Pre_Confirmation" {
        // pre confirmation page
        is_name_taken = false;
        for(var i = 0; i < array_height_2d(taken_name); i++) {
            if string_lower(taken_name[i, 0]) == string_lower(current_string) {
                header_text = taken_name[i, 1];
                is_name_taken = taken_name[i, 2];
                name_taken_index = i;
                break;
            }
        }
        name_state = "Confirmation";
    }
    if name_state == "Confirmation" {
        // name confirmation page
        if name_index < 1 {
            name_index += 0.25 / room_speed; // 0 to 1 in 4 seconds;
            if name_index > 1 {
                name_index = 1;
            }
        }
        if is_name_taken == false {
              if keyboard_check_pressed(vk_left) {
                confirmation_index -= 1;
              }
              if keyboard_check_pressed(vk_right) {
                confirmation_index += 1;
              }
              if confirmation_index != clamp(confirmation_index, 0, array_length_1d(confirmation_text) - 1) {
                confirmation_index = clamp(confirmation_index, 0, array_length_1d(confirmation_text) - 1);
              }
        }
        if keyboard_check_pressed(vk_enter) {
            if is_name_taken == true {
                confirmation_index = 0;
            }
            if confirmation_index == 0 {
                // "No"
                confirmation_index = 1;
                name_state = "Choosing_Name";
                header_text = "Name the fallen human.";
            } else if confirmation_index == 1 {
                // "Yes"
                show_message("Pass the (current_string) on");
                // Remove next line after testing
                name_state = "Choosing_Name";
                // Remove next line after testing
                header_text = "Name the fallen human.";
            }
        }
    }
}

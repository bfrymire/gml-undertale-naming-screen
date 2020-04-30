// set font
draw_set_font(fnt_dtm_sans);

// set variables
var draw_y, character_width, character_height, ii, i, ascii_x, last_y, last_line_width;
draw_y = 0;
character_width = string_width(string_hash_to_newline("W"));
character_height = string_height(string_hash_to_newline("W"));
spacing_width = 48;
spacing_height = 0;
ascii_x = floor((room_width/2) - ((spacing_width * max_string + character_width * 7) / 2)) + 1

// draw title
draw_set_color(string_color);
draw_y += 32;
draw_text_ext(floor(room_width/2 - spacing_width*3)+1,draw_y,string_hash_to_newline(string(header_text)),-1,spacing_width*6);


// draw typed name
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_y += character_height + 10;
// draw_text(floor((room_width/2)-(character_width*6)/2),draw_y,string(current_string));
draw_text_transformed(floor(room_width/2)+1,draw_y+(character_height/2),string_hash_to_newline(current_string),1+(4*name_index),1+(4*name_index),0);
// resetting the aligns
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if name_state == "Choosing_Name" {
    // 'Choosing_Name' screen
    // drawing ascii_characters
    draw_y += character_height + 10;
    for(ii = array_height_2d(ascii_characters) - 2; ii > -1; ii--) {
        for(i = array_length_2d(ascii_characters, ii) - 1; i > -1 ; i--) {
            // change color if currently selected index
            if ii == string_position_y && i == string_position_x {
                draw_set_color(string_highlight_color);
            } else draw_set_color(string_color);
            draw_text(ascii_x + ((character_width + spacing_width) * i) - string_wobble + floor(random(string_wobble * 2)),draw_y + ((character_height + spacing_height) * ii) - string_wobble + floor(random(string_wobble * 2)),string_hash_to_newline(ascii_characters[ii, i]));
        }
    }
    // draw last line of ascii_characters
    ii = array_height_2d(ascii_characters) - 1;
    last_y = draw_y + ((character_height + spacing_height) * ii) + 8;
    last_line_width = 0;
    for(i = 0; i < array_length_2d(ascii_characters, ii); i++) {
        // change color if currently selected index
        if ii == string_position_y && i == string_position_x {
            draw_set_color(string_highlight_color);
        } else draw_set_color(string_color);
        draw_text(ascii_x + last_line_width + (spacing_width * i),last_y,string_hash_to_newline(ascii_characters[ii, i]));
        last_line_width += string_width(string_hash_to_newline(ascii_characters[ii, i]));
    }
} else if name_state == "Confirmation" {
    // 'Confirmation' Screen
    if is_name_taken = false {
         for(var i = 0; i < array_length_1d(confirmation_text); i++) {
              if i == confirmation_index {
                draw_set_color(string_highlight_color);
              }
              // edit this later to place correctly on screen
              draw_text(10 + i * 64,64,string_hash_to_newline(string(confirmation_text[i])));
              // reset draw color back to 'string_color'
              draw_set_color(string_color);
         }
    } else {
         draw_set_color(string_highlight_color);
         draw_text(10,64,string_hash_to_newline("Go back")); // edit this later to place correctly on screen
         draw_set_color(string_color);
    }      
}


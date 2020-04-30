// testing controls
if keyboard_check(vk_control) {
    if keyboard_check_pressed(ord("R")) {
        game_restart();
    }
    if keyboard_check_pressed(ord("W")) {
        game_end();
    }
}

// go to naming screen
if keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) {
    window_set_cursor(cr_default);
    room_goto_next();
}

// init variables
var box_x, box_y;
box_x = room_width - 5 - sprite_get_width(spr_twitter) - 3 - string_width(string_hash_to_newline("@frymangames")) - 5;
box_y = room_height - 5 - sprite_get_height(spr_twitter) - 5;
// shameless plug of my twitter account
// twitter.com/frymangames
if mouse_x >= box_x && mouse_y >= box_y {
    window_set_cursor(cr_handpoint);
    if mouse_check_button(mb_any) {
        url_open_ext("https://twitter.com/frymangames", "_blank");
    }
} else {
    window_set_cursor(cr_default);
}

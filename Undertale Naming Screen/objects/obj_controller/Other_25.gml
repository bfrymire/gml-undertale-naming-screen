/// @description METHODS
/// Feather disable GM2016


/**
 * @function confirmation_button_pressed
 * @returns {Bool}
 */
confirmation_button_pressed = function() {
    for(var i = 0; i < array_length(confirmation_buttons); ++i) {
        if keyboard_check_pressed(confirmation_buttons[i]) {
            return true;
        }
    }
    return false;
}

/**
 * @function add_name
 * @param {String} _name
 * @param {String} _message
 * @param {Bool} [_is_forbidden=false]
 * @returns {Id.Instance}
 */
add_name = function(_name, _message, _is_forbidden=false) {
    if !is_string(_name) {
        throw(string("{0}.add_name() \"name\" expected a string, received {1}.", object_get_name(object_index), typeof(_name)));
    }
    if !is_string(_message) {
        throw(string("{0}.add_name() \"message\" expected a string, received {1}.", object_get_name(object_index), typeof(_message)));
    }
    if !is_bool(_is_forbidden) {
        throw(string("{0}.add_name() \"is_forbidden\" expected a boolean, received {1}.", object_get_name(object_index), typeof(_is_forbidden)));
    }
    array_push(taken_names, {
        name: _name,
        message: _message,
        is_forbidden: _is_forbidden
    });
    return id;
}

/**
 * Hook to run when the "Quit" action is triggered
 * @function on_quit
 * @returns {Id.Instance}
 */
on_quit = function() {
    room_goto_previous();
    return id;
}

/**
 * Hook to run when the "Backspace" action is triggered
 * @function on_backspace
 * @returns {Id.Instance}
 */
on_backspace = function() {
    current_string = string_backspace(current_string);
    return id;
}

/**
 * Hook to run when the "Done" action is triggered
 * @function on_done
 * @returns {Id.Instance}
 */
on_done = function() {
    if string_length(current_string) > 0 {
        name_state = NAME_STATES.PRE_CONFIRMATION;
    }
    return id;
}

/**
 * You can clear out this function and add your own names here
 * @function add_taken_names
 * @returns {Id.Instance}
 */
add_taken_names = function() {
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

    return id;
}

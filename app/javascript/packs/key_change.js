const SHARP_NOTES = ["A", "A♯", "B", "C", "C♯", "D", "D♯", "E", "F", "F♯", "G", "G♯"];
const FLAT_NOTES = ["A", "B♭", "B", "C", "D♭", "D", "E♭", "E", "F", "G♭", "G", "A♭"];
const ADDITIONS = ["add2", "add9", "dim7", "dim", "sus4", "sus", "maj7", "maj", "m7",
                   "m", "aug", "2", "6", "7", "9", "11"];

function position_of(note) {
  if (is_flat(note)) {
    return FLAT_NOTES.indexOf(note);
  } else {
    return SHARP_NOTES.indexOf(note);
  }
}

function replace_mark(str) {
  if (is_sharp(str)) {
    str = str.replace(/#/g, "♯");
  }
  if (is_flat(str)) {
    str = str.replace(/b/g, "♭");
  }
  return str;
}

function is_sharp(note) {
  if (/#|♯/.test(note)) { return true; }
  return false;
}

function is_flat(note) {
  if(/b|♭/.test(note)) { return true; }
  return false;
}

// Returns a boolean which shows whether the key moved up or not,
// Along with how many steps the key change actually is.
// One chromatic half step is handled as a difference of 1.
function find_key_change_difference(original_key, new_key) {
  var original_key_pos = position_of(original_key) + 1;
  var new_key_pos = position_of(new_key) + 1;

  if(original_key_pos > new_key_pos) {
    return [false, original_key_pos - new_key_pos];
  } else if (original_key_pos < new_key_pos) {
    return [true, new_key_pos - original_key_pos];
  } else {
    return [false, 0];
  }
}

// Isolate the addition (i.e. "dim", "m7") from the chord
// so the key change logic handles only the note by itself.
function isolate_addition_from(chord) {
  var add = ""
  for (var n = 0; n < ADDITIONS.length; n++) {
    var regexp = new RegExp(ADDITIONS[n]);
    if (regexp.test(chord)) {
      add = ADDITIONS[n];
      chord = chord.replace(regexp, "");
      break;
    }
  }
  return [chord, add];
}

// Calculate where the new chord will be, and return the new position
// to declare the proper strings and finish off the key change.
function get_new_chord_position(chord, difference, key_up) {
  var old_pos = position_of(chord) + 1;
  var new_pos = 0;

  if (key_up) {
      new_pos = old_pos + difference;
      if (new_pos > 12) {
        new_pos -= 12;
      }
   } else {
      new_pos = old_pos - difference;
      if (new_pos < 1) {
        new_pos += 12;
      }
  }

  // Decrement the new position once so the array is declared properly.
  --new_pos;

  return new_pos;
}

function key_change(original_key, slash_chords, new_key = null, song_body) {
  if(new_key == null) {
    var new_key = document.getElementById('key_box').value;
  }
  var chord_strings = [];
  var new_chords = [];

  // If an array of slash chords (i.e. ["G", "B"]) has been
  // passed to the function, use it as is.
  // Otherwise, pull the chords from their
  // span elements and push them to chord_strings for handling.
  if (slash_chords) {
    chord_strings = slash_chords;
  } else {
    var chords_html = song_body.children;
    for (var i = 0; i < chords_html.length; i++) {
      chord_strings.push(chords_html[i].getAttribute('name'));
    }
  }

  original_key = replace_mark(original_key);
  new_key = replace_mark(new_key);
  for (var i = 0; i < chord_strings.length; i++) {
    chord_strings[i] = replace_mark(chord_strings[i]);
  }

  var results = find_key_change_difference(original_key, new_key);
  var key_up = results[0];
  var difference = results[1];

  // If the chords are slash chords, they are split here and
  // processed recursively into another iteration of key_change.
  // Otherwise, simply calculate the key change.
  for (i = 0; i < chord_strings.length; i++) {
    if (/\//.test(chord_strings[i])) {
      slash_chord_array = chord_strings[i].split("/");
      var new_array = key_change(original_key, slash_chord_array, new_key, song_body);
      chord_strings[i] = new_array[0] + "/" + new_array[1];
      new_chords.push(chord_strings[i]);
      chords_html[i].innerHTML = new_chords[i];
    } else {
      results = isolate_addition_from(chord_strings[i]);
      chord_strings[i] = results[0];
      var addition = results[1];

      var new_position = get_new_chord_position(chord_strings[i], difference, key_up);
      if (is_flat(chord_strings[i])) {
        new_chords.push(FLAT_NOTES[new_position] + addition);
      } else {
        new_chords.push(SHARP_NOTES[new_position] + addition);
      }

      // Although chords_html doesn't have its own for loop,
      // It holds the same place as chord_strings[i],
      // so each element (span element) is updated accordingly here.
      if (!slash_chords) {
        chords_html[i].innerHTML = new_chords[i];
      }
    }
  }

  if (slash_chords) {
    return new_chords;
  }
}

// SetList#show loads the key change function automatically,
// so key_change is attached/fired differently depending on the page.
var set_list_songs = document.getElementsByClassName("set_list_song");
var print_song_body = document.getElementsByClassName("print_song_body");
if (set_list_songs.length >= 1){
    $('.song_body').each(function() {
        var keys = this.getAttribute('value');
        keys = keys.split("/");
        var original_key = keys[0];
        var new_key = keys[1];

        $(() =>
          $('.set_list_song').on(
              'load',
              key_change(original_key, null, new_key, this)
          )
        );
    })
} else if(set_list_songs.length == 0) {
    var song_body = document.getElementsByClassName("song_body")[0];
    $(() =>
      $('#key_box').on(
          'change',
            () => key_change($('#key_box').attr('class'), null, null, song_body)
      )
    );
}

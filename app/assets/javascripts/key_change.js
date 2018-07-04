const SHARP_NOTES = ["A", "A♯", "B", "C", "C♯", "D", "D♯", "E", "F", "F♯", "G", "G♯"];
const FLAT_NOTES = ["A", "B♭", "B", "C", "D♭", "D", "E♭", "E", "F", "G♭", "G", "A♭"];
const ADDITIONS = ["add2", "add9", "dim7", "dim", "sus4", "sus", "maj7", "maj", "m7",
                   "m", "aug", "2", "6", "7", "9", "11"];

// TODO: メソッドの名前 - is_sharpか何かに変えてください
function check_sharp(note) {
  if (/#/.test(note) || /♯/.test(note)) {
  return true;
  } else {
  return false;
  }
}

function check_flat(note) {
  if (/b/.test(note) || /♭/.test(note)) {
    return true;
  } else {
    return false;
  }
}

// TODO: initialize_song.jsにもあるからどっちかを消してください
// 「b」が「♭」に、「#」が「♯」に変換されます
function replace_mark(note) {
  if (check_sharp(note)) {
    note = note.replace(/#/, "♯");
  }
  if (check_flat(note)) {
    note = note.replace(/b/, "♭");
  }
  return note;
}

function position_of(note) {
  if (check_flat(note)) {
    return FLAT_NOTES.indexOf(note);
  } else {
    return SHARP_NOTES.indexOf(note);
  }
}

// TODO: old_keyの変わりにoriginal_keyを書いてください
// songs/show.html.erbではその歌の@song.keyをすーっと参照するから
function key_change(old_key, slash_chords) {
  var new_key = document.getElementById('key_box').value;
  var key_up;
  var difference;
  var chord_strings = [];
  var new_chords = [];
  var print_hidden_tag = document.getElementById('song_selectedKey');

  console.log(old_key);
  console.log(new_key);

  if(print_hidden_tag) { print_hidden_tag.value = new_key }

  if (slash_chords) {
    var chords_html = slash_chords;
    chord_strings = chords_html;
  } else {
    var chords_html = document.getElementsByClassName('chord');
    for (var i = 0; i < chords_html.length; i++) {
      chord_strings.push(chords_html[i].getAttribute('name'));
    }
  }

  old_key = replace_mark(old_key);
  new_key = replace_mark(new_key);
  for (var i = 0; i < chord_strings.length; i++) {
    chord_strings[i] = replace_mark(chord_strings[i]);
  }

  var old_key_pos = position_of(old_key) + 1;
  var new_key_pos = position_of(new_key) + 1;

  if (old_key_pos > new_key_pos) {
    key_up = false;
    difference = old_key_pos - new_key_pos;
  } else if (old_key_pos < new_key_pos) {
    key_up = true;
    difference = new_key_pos - old_key_pos;
  } else {
    difference = 0;
  }

  for (i = 0; i < chord_strings.length; i++) {

    if (/\//.test(chord_strings[i])) {
      slash_chord_array = chord_strings[i].split("/");
      var new_array = key_change(old_key, slash_chord_array);
      chord_strings[i] = new_array[0] + "/" + new_array[1];
      new_chords.push(chord_strings[i]);
      chords_html[i].innerHTML = new_chords[i];
    } else {

      var addition = "";
      for (var n = 0; n < ADDITIONS.length; n++) {
        var regexp = new RegExp(ADDITIONS[n]);
        if (regexp.test(chord_strings[i])) {
          addition = ADDITIONS[n];
          chord_strings[i] = chord_strings[i].replace(regexp, "");
          break;
        }
      }

      var old_position = position_of(chord_strings[i]) + 1;
      var new_position = 0;

      if (key_up) {
          new_position = old_position + difference;
          if (new_position > 12) {
            new_position -= 12;
          }
       } else {
          new_position = old_position - difference;
          if (new_position < 1) {
            new_position += 12;
          }
      }
      --new_position;

      if (check_flat(chord_strings[i])) {
        new_chords.push(FLAT_NOTES[new_position] + addition);
      } else {
        new_chords.push(SHARP_NOTES[new_position] + addition);
      }
      if (!slash_chords) {
        chords_html[i].innerHTML = new_chords[i];
      }
    }
  }
  if (slash_chords) {
    return new_chords;
  }
}

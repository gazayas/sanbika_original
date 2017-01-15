const SHARP_NOTES = ["A", "A♯", "B", "C", "C♯", "D", "D♯", "E", "F", "F♯", "G", "G♯"];
const FLAT_NOTES = ["A", "B♭", "B", "C", "D♭", "D", "E♭", "E", "F", "G♭", "G", "A♭"];
const ADDITIONS = ["add2", "add9", "dim7", "dim", "sus4", "sus", "maj7", "maj", "m7",
                   "m", "aug", "2", "6", "7", "9", "11"];

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

// 「b」が「♭」に、「#」が「♯」に変換されます
function replace_mark(note) {
  if (check_sharp(note)) {
    note = note.replace(/#/g, "♯"); // gは要らないと思う
  }
  if (check_flat(note)) {
    note = note.replace(/b/g, "♭");
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

function key_change(old_key, slash_chords) {

  var new_key = document.getElementById('key_box').value;
  var key_up;
  var difference;
  var chords = [];
  var new_chords = [];

  if (slash_chords) {
    var chords_html = slash_chords;
    chords = chords_html;
  } else {
    var chords_html = document.getElementsByClassName('chord');
    for (var i = 0; i < chords_html.length; i++) {
      chords.push(chords_html[i].getAttribute('name'));
    }
  }

  old_key = replace_mark(old_key);
  new_key = replace_mark(new_key);
  for (var i = 0; i < chords.length; i++) {
    chords[i] = replace_mark(chords[i]);
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
    /* このブロック自体は要らないかもしれない
    var original_chords = [];
    for (i = 0; i < chords_html.length; i++) {
      //chords_html[i]は文字列の場合なら、slash chordになっていることが分かるから、
      //その場合は何もしなくて、chords_htmlは本当にnodeである場合のみoriginal_chordsを実装する。
      //slash chordを使ったらこのfor文の直接前にあるconsole.log();の出力を見てください
      if (typeof chords_html[i] != 'string') {
        chords_html[i].innerHTML = chords_html[i].getAttribute('name');
      }
    }
    */
  }

  for (i = 0; i < chords.length; i++) {

    if (/\//.test(chords[i])) {
      slash_chord_array = chords[i].split("/");
      var new_array = key_change(old_key, slash_chord_array);
      chords[i] = new_array[0] + "/" + new_array[1];
      new_chords.push(chords[i]);
      chords_html[i].innerHTML = new_chords[i];
    } else {

      var addition = "";

      for (var n = 0; n < ADDITIONS.length; n++) {
        var stuff = new RegExp(ADDITIONS[n]);
        if (stuff.test(chords[i])) {
          addition = ADDITIONS[n];
          chords[i] = chords[i].replace(stuff, "");
          break;
        }
      }

      var old_position = position_of(chords[i]) + 1;
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

      if (check_flat(chords[i])) {
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

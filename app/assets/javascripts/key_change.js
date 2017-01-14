// 音符の定義
const SHARP_NOTES = ["A", "A♯", "B", "C", "C♯", "D", "D♯", "E", "F", "F♯", "G", "G♯"];
const FLAT_NOTES = ["A", "B♭", "B", "C", "D♭", "D", "E♭", "E", "F", "G♭", "G", "A♭"];

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

// 「b」か「#」がnoteに入っていれば、「♭」か「♯」に変換する
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

// 主要のメソッド
function change(old_key, slash_chords) {
  // chords_node_listはたまに(slash chordの場合)node_listじゃなくて配列なのでchords_listに変えた方がいいかな

  var new_key = document.getElementById('key_box').value;
  if (slash_chords) {
    var chords_html = slash_chords;
  } else {
    var chords_html = document.getElementsByClassName('chord');
  }

  var key_up;
  var difference = 0;
  var chords = [];
  var new_chords = [];


  if (slash_chords) {
    chords = chords_html;
  } else {
    for (var i = 0; i < chords_html.length; i++) {
      chords.push(chords_html[i].getAttribute('name'));
    }
  }

  // 「b」か「#」が入っていれば、「♭」か「♯」に変換する
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
    var original_chords = [];
    // console.log(chords_html);
    for (i = 0; i < chords_html.length; i++) {
      // chords_html[i]は文字列の場合なら、slash chordになっていることが分かるから、
      // その場合は何もしなくて、chords_htmlは本当にnodeである場合のみoriginal_chordsを実装する。
      // slash chordを使ったらこのfor文の直接前にあるconsole.log();の出力を見てください
      if (typeof chords_html[i] != 'string') {
        chords_html[i].innerHTML = chords_html[i].getAttribute('name');
      }
    }
  }

  for (i = 0; i < chords.length; i++) {

    if (/\//.test(chords[i])) {
      slash_chord_array = chords[i].split("/");

      var new_array = change(old_key, slash_chord_array);

      chords[i] = new_array[0] + "/" + new_array[1];
      new_chords.push(chords[i]);
      chords_html[i].innerHTML = new_chords[i];
    } else {

    var addition = "";

    switch(true) {
      // chordをnameの属性から取得したので、正規表現で「dim7」などを除いて新しいchordのための計算する
      case /dim7/.test(chords[i]):
        addition = "dim7";
        chords[i] = chords[i].replace(/dim7/, "");
        break;
      case /dim/.test(chords[i]):
        addition = "dim";
        chords[i] = chords[i].replace(/dim/, "");
        break;
      case /2/.test(chords[i]):
        addition = "2";
        chords[i] = chords[i].replace(/2/, "");
        break;
      case /sus4/.test(chords[i]):
        addition = "sus4";
        chords[i] = chords[i].replace(/sus4/, "");
        break;
      case /sus/.test(chords[i]):
        addition = "sus";
        chords[i] = chords[i].replace(/sus/, "");
        break;
      case /maj7/.test(chords[i]):
        addition = "maj7";
        chords[i] = chords[i].replace(/maj7/, "");
        break;
      case /maj/.test(chords[i]):
        addition = "maj";
        chords[i] = chords[i].replace(/maj/, "");
        break;
      case /m7/.test(chords[i]):
        addition = "m7";
        chords[i] = chords[i].replace(/m7/, "");
        break;
      case /m/.test(chords[i]):
        addition = "m";
        chords[i] = chords[i].replace(/m/, "");
        break;
      case /7/.test(chords[i]):
        addition = "7";
        chords[i] = chords[i].replace(/7/, "");
        break;
      case /6/.test(chords[i]):
        addition = "6";
        chords[i] = chords[i].replace(/6/, "");
        break;
      case /9/.test(chords[i]):
        addition = "9";
        chords[i] = chords[i].replace(/9/, "");
        break;
      case /aug/.test(chords[i]):
        addition = "aug";
        chords[i] = chords[i].replace(/aug/, "");
        break;
      case /11/.test(chords[i]):
        addition = "11";
        chords[i] = chords[i].replace(/11/, "");
      default:
        break;
    }

    var old_position = position_of(chords[i]) + 1;
    var new_position = 0; // 最初は定義するだけ

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
  } // slash_chordsがnullじゃない場合の終わり？
  } // 大きなfor文の終わり
  if (slash_chords) {
    return new_chords;
  }
}

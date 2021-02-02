/* The following code is used primarily in songs#show */

// The follwing Regular Expression has a Japanese white-space character in it.
// TODO: For clarity, it might be better to simply change it a hexidecimal value.
// The value may change depending on the encoding.
var WHITE_SPACE_REGEXP = /(\s+|　+)/;
var CHORD_REGEXP = /[A-G]{1,1}/;

function replace_marks(str) {
  if (is_sharp(str)){
    str = str.replace(/#/g, "♯");
  } else if (is_flat(str)) {
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

function has_chords(ary) {
  for(var i = 0; i < ary.length; i++) {
    if(WHITE_SPACE_REGEXP.test(ary[i]) || ary[i] == "") {
      // String is empty, go to next value
    } else if(!CHORD_REGEXP.test(ary[i]) || /Chorus|CHORUS|Bridge|BRIDGE/.test(ary[i])) {
      // Has lyrics or something else which isn't a chord
      return false;
    }
  }
  return true;
}

// The chords are wrapped with a span and given a class
// so it can work with the key_change function.
// The Regular Expression here checks if there is a word
// (or chord, as opposed to white space) at the beginning of the string.
function wrap_chords_with_span(ary) {
  for(i = 0; i < ary.length; i++) {
    if(/^\w/.test(ary[i])) {
      ary[i] =
        '<span class="chord" name="' + replace_marks(ary[i]) + '">' +
          replace_marks(ary[i]) +
        '</span>';
    }
  }
  return ary;
}

// Take each song body on the page and wrap each chord it has in a span.
$(document).ready(function() {
  var song_bodies = document.getElementsByClassName("song_body");

  // Break down the song_body line by line and
  // determine if the line has chords or not.
  // Then put the song body back together.
  $.each(song_bodies, function(i) {
      var song_body_lines = song_bodies[i].innerHTML.split(/\r*\n/);
      $.each(song_body_lines, function(j) {
        var str_ary = song_body_lines[j].split(WHITE_SPACE_REGEXP);
        if(has_chords(str_ary)) { str_ary = wrap_chords_with_span(str_ary); }
        song_body_lines[j] = str_ary.join("");
      });

      var song_body = song_body_lines.join("<br>");
      song_bodies[i].innerHTML = song_body;
  });

  $('.chord').each(function() { this.style.color = "navy"; });
  $('iframe').addClass('embed-responsive-item');
});

function toggle_visibility() {
  var chords = document.getElementsByClassName('chord');
  var visibility = $('.visibility_checkbox:checked').val() ? 'hidden' : 'visible';

  for(var i = 0; i < chords.length; i++) { chords[i].style.visibility = visibility; }
}

$(() =>
  $('.visibility_checkbox').on('click', () => toggle_visibility())
);

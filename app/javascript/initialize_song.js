/* The following code is used primarily in songs#show */

// TODO: sharp_or_flat_is_present_in(str)

function replace_marks(str) {
  if (check_sharp(str)) {
    str = str.replace(/#/g, "♯");
  }
  if (check_flat(str)) {
    str = str.replace(/b/g, "♭");
  }
  return str;
}

$(document).ready(function() {
  var song_body_tag = document.getElementById("song_body");
  var song_body = song_body_tag.innerHTML.split(/\r*\n/);
  var chord_regexp = /[A-G]{1,1}/;

  for(var i = 0; i < song_body.length; i++) {
    var has_chords;

    // The follwing Regular Expression has a Japanese white-space character in it.
    // TODO: For clarity, it might be better to simply change it a hexidecimal value.
    var str_ary = song_body[i].split(/(\s+|　+)/);

    // TODO: Refactor this expression, make it into its own function.
    for(var x = 0; x < str_ary.length; x++) {
      if(/\s+|　+/.test(str_ary[x]) || str_ary[x] == "") {
        // Goes on to the next value if there is a space
      } else if(!chord_regexp.test(str_ary[x]) || /Chorus|CHORUS|Bridge|BRIDGE/.test(str_ary[x])) {
        has_chords = false
        x = str_ary.length;
      } else {
        has_chords = true;
      }
    }

    // If the array of strings consists of chords (as opposed to lyrics),
    // Each one is wrapped in a span with the class .chord,
    // and all of the flat and sharp flags (b and #) are changed accordingly.
    if(has_chords) {
      for(x = 0; x < str_ary.length; x++) {
        if(/^\w/.test(str_ary[x])) {
          str_ary[x] =
            '<span class="chord" name="' + replace_marks(str_ary[x]) + '">' +
              replace_marks(str_ary[x]) +
            '</span>';
        }
      }
    }

    song_body[i] = str_ary.join("");
  }

  // Put the song body together again by joining the array of strings
  song_body = song_body.join("<br>");

  // TODO: Look into what's going on here and refactor this next line
  song_body = song_body.replace(/^<br>\s{2,2}/, "");
  song_body_tag.innerHTML = song_body;

  $('.chord').each(function() { this.style.color = "navy"; })
  $('iframe').addClass('embed-responsive-item')
});

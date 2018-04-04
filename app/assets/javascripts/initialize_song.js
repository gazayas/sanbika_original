/* songs/show.html.erbで使います */

// TODO: print.html.erbで実装すること


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
    var str_ary = song_body[i].split(/(\s+|　+)/); // zenkakuも含めて

    for(var x = 0; x < str_ary.length; x++) {
      if(/\s+|　+/.test(str_ary[x]) || str_ary[x] == "") {
        // 空白だったら分からないからそのままcontinue
      } else if(!chord_regexp.test(str_ary[x]) == /Artist/.test(str_ary[x])) {
        // falseが一回でも出たらbreak
        has_chords = false
        x = str_ary.length;
      } else {
        has_chords = true;
      }
    }

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

  // joinして実装
  song_body = song_body.join("<br>");
  song_body = song_body.replace(/^<br>\s{2,2}/, ""); // なぜこうなるだろうか分からんけど、<br>と空白が先頭に入るから消す
  song_body_tag.innerHTML = song_body;


  // song.title_yomikataをtooltipとして表示します
  $(function () {
    $('[data-toggle="tooltip"]').tooltip();
  });
  // content_tagではdata-toggleなどを定義できないのでjsの方でしています
  document.getElementById('song_title').setAttribute('data-toggle', 'tooltip');
  document.getElementById('song_title').setAttribute('data-placement', 'bottom');

  // iframeにクラスをつける
  $('iframe').addClass('embed-responsive-item');
});

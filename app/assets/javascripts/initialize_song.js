/* songs/show.html.erbで使います */

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

function change_whitespace_of(str) {
  str = str.replace(/&nbsp;/g, " ");
  str = str.replace(/　/g, " "); // 全角を半角に
  return str;
}


// TODO: Refactoring

$(document).ready(function() {
  // <br>で区切る
  // 適切な正規表現を使ってコードが入ってるかどうか確認する
    // 先頭には[A-G]がない場合、その行全体は歌詞だと判る
  // 入ってたら、replace_marksして、<span class="chord"></span>で包む
  // nameを与える
  // joinして実装する

  var song_body_tag = document.getElementById("song_body");
  song_body_tag.innerHTML = song_body_tag.innerHTML.replace(/<\/?p>/g, ""); // 厄介だな

  // tinymceは最初の方に改行の\nを入れてしまうからそれを消す
  song_body_tag.innerHTML = song_body_tag.innerHTML.replace(/\r?\n/, "");

  var song_body = song_body_tag.innerHTML.split("<br>");
  var regexp = /^[A-G]{1,1}/; //{1,1}をつけた方が確率を上げるかな
  var chord_regexp = /^[A-G].*/;

  for(var i = 0; i < song_body.length; i++) {
    var has_chords;

    song_body[i] = change_whitespace_of(song_body[i]);
    var str_ary = song_body[i].split(" ");

    for(var x = 0; x < str_ary.length; x++) {
      if(str_ary[x] == "" || str_ary[x] == " ") {
        // 空白だったらcontinue
      } else if(!regexp.test(str_ary[x])) {
        // falseが一回でもあったらbreak
        has_chords = false
        x = str_ary.length;
      } else {
        has_chords = true;
      }
    }

    if(has_chords) {
      for(x = 0; x < str_ary.length; x++) {
        if(chord_regexp.test(str_ary[x])) {
          console.log(RegExp.input);
          str_ary[x] = '<span class="chord" name="' + replace_marks(RegExp.input) + '">' + replace_marks(RegExp.input) + '</span>';
        }
      }
    }
    song_body[i] = str_ary.join(" ");
  }

  // joinして実装
  song_body = song_body.join("<br/>");
  song_body_tag.innerHTML = "<p>" + song_body + "</p>";

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

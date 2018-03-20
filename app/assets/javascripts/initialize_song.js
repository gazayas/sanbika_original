/* songs/show.html.erbで使います */

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
  var song_body_html = document.getElementById('song_body');
  var song_body = song_body_html.innerHTML.split("\n");
  var chord_regexp = /([A-G])([a-u]|#|♭|♯)*(\/)?([A-G])?([a-u]?|#|♭|♯)*/g

  // もし変調の対象となってしまってるけどそうなってほしくない場合（行の最後に*を書く
  // 特に英語のチャートを書く場合はこうなるじゃないかと思う
  // TODO: 例えばその行にたくさんの小文字が入ってたら、それは歌詞かもしれない
  for(var i = 0; i < song_body.length; i++) {
    // とりあえずこれだけでいい。開発を進むうちにこの正規表現を変えてもいいかもしれない
    if ((chord_regexp).test(song_body[i]) == !(/\*$/).test(song_body[i])) {
      var chord_span = song_body[i].replace(
        chord_regexp,
        '<span class="chord" name="$1$2$3$4$5">' + '$1$2$3$4$5' + '</span>'
        );
      song_body[i] = chord_span;
    } else if(/\*$/) {
      song_body[i] = song_body[i].replace(/\*$/, "");
    }
    song_body[i] += "\n";
  }

  song_body_html.innerHTML = song_body.join("");

  var chord_spans = document.getElementsByClassName("chord");
  for (i = 0; i < chord_spans.length; i++) {
    chord_spans[i].innerHTML = replace_marks(chord_spans[i].innerHTML);
  }
/*
  var chords = document.getElementsByClassName('chords');

  for(var i = 0; i < chords.length; i++) {
    chords[i].innerHTML = new_innerHTML[i];
  }

  // song.title_yomikataをtooltipとして表示します
  $(function () {
    $('[data-toggle="tooltip"]').tooltip();
  });
  // content_tagではdata-toggleなどを定義できないのでjsの方でしています
  document.getElementById('song_title').setAttribute('data-toggle', 'tooltip');
  document.getElementById('song_title').setAttribute('data-placement', 'bottom');

  // iframeにクラスをつける
  $('iframe').addClass('embed-responsive-item');
  */
});

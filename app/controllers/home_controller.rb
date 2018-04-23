class HomeController < ApplicationController
  def index
  	if I18n.locale == I18n.default_locale
  		example_user = User.find_by(name: 'gazayas')
    	@example_song = example_user.songs.where(title: "主の足元に").first
    else
    	# TODO: 英語のチャートと入れ替えてください。How Great Is Our God
    	example_user = User.find_by(name: 'gazayas')
    	@example_song = example_user.songs.where(title: "主の足元に").first
    end
  end

  def songs
    @songs = Song.page(params[:page]).per(25)

    # TODO: gemで漢字をひらながに変換してから順に並べたい
  end
end

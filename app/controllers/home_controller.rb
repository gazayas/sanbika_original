class HomeController < ApplicationController
  def index
    example_user = User.find_by(name: 'gazayas')
    @example_song = example_user.songs.where(title: "主の足元に").first
  end

  def songs
    @songs = Song.page(params[:page]).per(25)

    # TODO: gemで漢字をひらながに変換してから順に並べたい
  end
end

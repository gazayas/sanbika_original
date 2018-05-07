class HomeController < ApplicationController
  def index
  end

  def songs
    @songs = Song.page(params[:page]).per(25)

    # TODO: gemで漢字をひらながに変換してから順に並べたい
  end
end

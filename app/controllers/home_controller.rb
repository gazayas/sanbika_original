class HomeController < ApplicationController
  def index
  end

  def songs
    @songs = Song.page(params[:page]).search(params[:search]).per(25)

    # TODO: gemで漢字をひらながに変換してから順に並べたい
  end

  def search
    @results = ""

    case params[:search_filter]
    when "Artist"
      @results = Song.page(params[:page]).where(["artist LIKE ?", params[:search_contents]]).per(25)
    when "Chart"
      @results = Song.page(params[:page]).where(["title LIKE ?", params[:search_contents]]).per(25)
    when "User"
      @results = User.page(params[:page]).where(["name LIKE ?", params[:search_contents]]).per(25)
    end
  end
end

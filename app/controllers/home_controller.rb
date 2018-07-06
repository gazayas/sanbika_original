class HomeController < ApplicationController
  def index
  end

  def songs
    # TODO: gemで漢字をひらながに変換してから順に並べたい
    @songs = Song.all.page(params[:page]).per(25)
  end

  def search
    #TODO: REFACTOOOOR

    @results = ""

    #TODO: Upcaseかdowncase、どちらでも適切にマッチするように
    if params[:search_filter]
      case params[:search_filter]
      when "Artist"
        @results = Song.page(params[:page]).where(["artist LIKE ?", params[:search_contents]]).per(25)
      when "Chart"
        @results = Song.page(params[:page]).where(["title LIKE ?", params[:search_contents]]).per(25)
      when "User"
        @results = User.page(params[:page]).where(["name LIKE ?", params[:search_contents]]).per(25)
      end
    else
      @results = Song.page(params[:page]).where(["title LIKE ?", params[:search_contents]]).per(25)
    end
  end
end

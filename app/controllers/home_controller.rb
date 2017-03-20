class HomeController < ApplicationController
  def index
  end

  def songs
    @songs = Song.page(params[:page]).per(25)
  end
end


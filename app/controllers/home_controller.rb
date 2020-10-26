class HomeController < ApplicationController
  def index
  end

  def songs
    @songs = Song.page(params[:page]).search(params[:search]).per(25)
  end
end

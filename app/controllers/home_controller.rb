class HomeController < ApplicationController
  def index
  end

  def songs
    @songs = Song.all
  end
end


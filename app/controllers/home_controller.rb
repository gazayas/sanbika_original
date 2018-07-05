class HomeController < ApplicationController
  def index
  end

  def songs
    @songs = Song.page(params[:page]).search(params[:search]).per(25)

    # TODO: gemで漢字をひらながに変換してから順に並べたい
  end

  def search
  	if params[:search_contents]
	  	@results = '入力した文字列：' + params[:search_contents]
	end
  	
  	# TODO: viewの方でselect_tagでアーティストかチャートか歌詞かのどちらかをしらべたいのかを決めて、
  	# ここで適切なSQLを実行する
  end
end

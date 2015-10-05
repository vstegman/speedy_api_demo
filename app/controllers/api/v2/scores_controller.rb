class Api::V2::ScoresController < ApplicationController
  def index
    #send = Score.all
    #render json: send
    render json: Oj.dump(ScoreReader.build_from_relation(Score.all), mode: :compat)
  end
end

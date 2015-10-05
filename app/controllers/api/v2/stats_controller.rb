class Api::V2::StatsController < ApplicationController
  def index
    #send = Score.all
    #render json: send
    average = Score.all.as_struct.map {|s| s.value}
    render json: Oj.dump(ScoreReader.build_from_relation(Score.all), mode: :compat)
  end
end

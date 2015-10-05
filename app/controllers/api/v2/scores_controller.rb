class Api::V2::ScoresController < ApplicationController
  def index
    scores = ScoreReader.build_from_relation(Score.where(user_id: params[:user_id]))
    hash = {
      meta: {user_id: params[:user_id], count: scores.length},
      scores: scores
    }
    render json: Oj.dump(hash , mode: :compat)
  end
end

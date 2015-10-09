class Api::V1::ScoresController < ApplicationController
  def index
    scores = Score.where(user_id: params[:user_id])
    hash = {
      meta: {user_id: params[:user_id], count: scores.length},
      scores: scores
    }
    #render json: hash
    # Step 2 Use Oj
    render json: Oj.dump(hash, mode: :compat)
  end
end


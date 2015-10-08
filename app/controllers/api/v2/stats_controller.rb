class Api::V2::StatsController < ApplicationController
  def index
    #stats = ScoreStat.new(Score.where(user_id: params[:user_id]))
    stats = AdvancedStat.new(Score.where(user_id: params[:user_id]))
    #stats = GroupedScore.new(Score.where(user_id: params[:user_id]))

    hash = {
      meta: {user_id: params[:user_id]},
      stats: stats
    }
    render json: Oj.dump(hash , mode: :compat)
  end
end

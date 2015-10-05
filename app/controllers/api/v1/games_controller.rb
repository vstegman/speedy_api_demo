class Api::V1::GamesController < ApplicationController
  def index
    render json: Game.all
  end

  def show
    render json: Game.find(params[:id])
  end
end

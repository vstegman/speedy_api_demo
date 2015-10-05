class Api::V1::ScoresController < ApplicationController
  def index
    send = Score.all
    #render json: send
    render json: Oj.dump(send, mode: :compat)
  end
end

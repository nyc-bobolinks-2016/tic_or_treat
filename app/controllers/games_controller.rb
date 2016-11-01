class GamesController < ApplicationController
  def index
  end

  def new
    game = Game.create(board:"---------",
                user_id: current_user.id,
                outcome: 1
                )
    session[:game_id] = game.id
    redirect_to game_path(game.id)
  end

  def update
    game = Game.find_by(id: session[:game_id])
    idx = params[:game][:id].to_i
    new_board = game.update_board(idx)




    game.update(board: new_board)
  end
end

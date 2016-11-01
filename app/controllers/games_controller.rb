class GamesController < ApplicationController
  def index
  end

  def new
    game = Game.create(board:"---------",
                user_id: current_user.id,
                outcome: 2
                )
    session[:game_id] = game.id
    redirect_to game_path(game.id)
  end

  def update
      game = Game.find_by(id: session[:game_id])
      idx = params[:game][:id].to_i
      new_board = game.update_board(idx)
      game.update(board: new_board)
      if game.win?('X')
        render json: "user"
      else
        if game.board.chars.select {|space| space == "-"}.count > 1
          newer_board = game.computer_guess
          game.update(board: newer_board.last)
          if game.win?('O')
            render json: "comp"
          else
            render json: newer_board.first.to_s
          end
        else
          render json: "false"
        end
      end
  end








end

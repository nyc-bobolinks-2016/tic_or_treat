class GamesController < ApplicationController

  def index
  end

  def new
    game = Game.create(board:"---------",
                user_id: set_user.id,
                outcome: 2
                )
    session[:game_id] = game.id
    redirect_to game_path(game.id)
  end

  def show
    game = Game.find_by(id: params[:id])
    session[:game_id] = game.id
    @board = game.board
    @outcome = game.outcome
  end

  def update
    game = Game.find_by(id: session[:game_id])
      idx = params[:game][:id].to_i
      new_board = game.update_board(idx)
      game.update(board: new_board)
      if game.win?('X')
        game.update(outcome: 1)
        render json: {winner: "user"}
      else
        if game.board.chars.select {|space| space == "-"}.count > 1
          newer_board = game.computer_guess
          game.update(board: newer_board.last)
          new_time = game.time_played + game.game_time
          game.update(time_played: new_time.to_f)
          if game.win?('O')
            game.update(outcome: -1)
            render json: {winner: "comp", move: newer_board.first.to_s}
          else
            render json: newer_board.first.to_s
          end
        else
          render json: "false"
        end
      end
  end
  private

  def set_user
    User.find_by(id: session[:user_id]) || User.find_by(id: 1)
  end
end

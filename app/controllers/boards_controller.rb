class BoardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board, only: %i[show edit update destroy delete_picture]

  def index
    @teams = Team.all.sort{ |team| -team.score }
  end

  def show
    @cells = @board.cells
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      flash[:success] = 'Your BINGO board has been created!'
      redirect_to @board
    else
      flash[:error] = 'Oops! Something went wrong. Please try again.'
      render 'new'
    end
  end

  def new
    redirect_to current_user.board if current_user.board
    @board = Board.new
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:user_id)
  end

end

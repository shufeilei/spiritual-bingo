class BoardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board, only: %i[show edit update destroy delete_picture]

  def index
    @teams = Team.includes(:users).where.not(users: {id: nil}).sort_by(&:score).reverse
  end

  def show
    @cells = @board.cells
    @user_possessive = @board.user == current_user ? 'my' : "#{@board.user.username}'s"
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

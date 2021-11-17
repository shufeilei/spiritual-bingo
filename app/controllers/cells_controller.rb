class CellsController < ApplicationController
  before_action :set_cell, only: %i[show edit update destroy delete_picture]
  before_action :authenticate_user!

  def index
    @row = params[:row].to_i
    @col = params[:col].to_i
    @cells = Cell.where(row: @row, col: @col).
      order(finished_at: :desc).includes(board: :user)

  end

  def new
    board = Board.find(params[:board_id].to_i)
    if board.user == current_user
      @cell = Cell.new( board_id: params[:board_id].to_i,
                        row: params[:row].to_i,
                        col: params[:col].to_i)
    else
      flash[:error] = "You cannot submit answers to another player's board."
      redirect_to board_path(board)
    end
  end

  def show
    # commontator_thread_show(@cell)
  end

  def edit
    unless @cell.board.user == current_user
      flash[:error] = 'You are not allowed to edit this cell.'
      redirect_to board_cell_path(@cell.board, @cell)
    end
  end

  def update
    if @cell.update(cell_params)
      redirect_to board_cell_path(@cell.board, @cell)
    else
      render 'edit'
    end
  end

  def create
    cell = Cell.new(cell_params)
    cell.finished_at = Time.now
    if cell.save
      flash[:success] = 'Congrats! You finished one cell! Keep up the good work!'
      redirect_to cell.board
    else
      flash[:error] = 'Please make sure you submit a response.'
      redirect_to new_board_cell_path(cell.board, cell)
    end
  end

  def destroy
    @cell.destroy
    redirect_to board_path(@cell.board)
  end

  def delete_picture
    @cell.picture = nil
    @cell.save
    redirect_to edit_board_cell_path(@cell.board, @cell)
  end

  private

  def set_cell
    @cell = Cell.find(params[:id])
  end

  def cell_params
    params.require(:cell).
      permit(:board_id, :row, :col, :response, :finished_at, :picture)
  end

end

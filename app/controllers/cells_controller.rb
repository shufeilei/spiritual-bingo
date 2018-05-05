class CellsController < ApplicationController
  before_action :set_cell, only: %i[show edit update destroy delete_picture]
  before_action :authenticate_user!

  def new
    @cell = Cell.new
    @selected_cell = Board::LAYOUT[params[:row].to_i][params[:col].to_i]
  end

  def show
  end

  def edit
    unless @cell.board.user == current_user
      flash[:error] = 'You are not allowed to edit this cell.'
      redirect_to board_cell_path(@cell.board, @cell)
    end
  end

  def update
    if @cell.update(cell_params)
      redirect_to @cell
    else
      render 'edit'
    end
  end

  def create
    cell_params[:finished_at] = Time.now
    cell = Cell.new(cell_params)
    if cell.save
      flash[:success] = 'Your BINGO cell has been created!'
    else
      flash[:error] = 'Oops! Something went wrong. Please try again.'
    end
    redirect_to cell.board
  end

  private

  def set_cell
    @cell = Cell.find(params[:id])
  end

  def cell_params
    params.require(:cell).permit(:board_id, :row, :col, :response, :finished_at)
  end

end

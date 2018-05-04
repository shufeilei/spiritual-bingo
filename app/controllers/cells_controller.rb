class CellsController < ApplicationController
  before_action :set_cell, only: %i[show edit update destroy delete_picture]

  def new
    @cell = Cell.new
    @selected_cell = Board::TEMPLATE[params[:row].to_i][params[:col].to_i]
  end

  def create
    @cell = Cell.new(cell_params)
    board = Board.find(params[:board_id])
    if @cell.save
      flash[:success] = 'Your BINGO cell has been created!'
    else
      flash[:error] = 'Oops! Something went wrong. Please try again.'
    end
    redirect_to board
  end

  private

  def set_cell
    @cell = Cell.find(params[:id])
  end

  def cell_params
    params.require(:cell).permit(:board_id, :row, :col, :response)
  end

end

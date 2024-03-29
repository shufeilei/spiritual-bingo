class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def show
    @sharings = @user.board.cells.order(finished_at: :desc)
  end

  def edit
    unless @user == current_user
      flash[:error] = 'You are not allowed to edit this profile.'
      redirect_to root_path
    end
    @user.team = Team.new unless @user.team
  end

  def update
    params[:user].delete('team_attributes') unless params[:user][:team_id]=='new'
    if @user.update(user_params)
      flash[:success] = 'Your profile has been updated.'
      redirect_to @user
    else
      flash[:error] = 'You are not allowed to edit this profile.'
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :team_id, team_attributes: [:name])
  end
end

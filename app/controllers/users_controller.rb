# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  def sign_out

  end

  private

  def set_user
    Rails.logger.info "Current user #{current_user.inspect}"
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email)
  end
end

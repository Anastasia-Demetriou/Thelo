class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  #before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = policy_scope(User).order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end



  private

  # def set_user
  #   @user = User.find(params[:id])
  # end
end

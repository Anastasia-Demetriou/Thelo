class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  #before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def index
  end

  private

  # def set_user
  #   @user = User.find(params[:id])
  # end
end

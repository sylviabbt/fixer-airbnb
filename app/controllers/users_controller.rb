class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]

  def show
    authorize @user
  end

  def edit
    @skill = Skill.new
    authorize @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end

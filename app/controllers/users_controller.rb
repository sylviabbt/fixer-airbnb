class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]

  def show
    authorize @user
  end

  def edit
    @skill = Skill.new
    authorize @user
  end

  def create
    @skill = Skill.new(skill_params)
    @user = current_user
    @skill.user = @user
    authorize @skill
    if @skill.save
      redirect_to @user
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end

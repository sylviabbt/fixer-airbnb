class SkillsController < ApplicationController

  before_action :set_skill, only: [:show, :destroy]
  def index
    @skills = Skill.all
  end

  def new
    @skill = Skill.new
  end

  def create
    @skills = Skill.new(skill_params)
    if @skill.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @skill.destroy
    redirect_to root_path
  end

  private

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:title, :price_per_hour, :earliest_available, :latest_available)
  end
end

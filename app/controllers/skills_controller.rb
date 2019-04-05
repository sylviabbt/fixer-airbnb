class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :destroy]
  after_action :verify_policy_scoped, only: [:index]

  def index
    if params[:query].present?
      @skills = policy_scope(Skill).where("title ILIKE ?", "%#{params[:query]}%")
    else
      @skills = policy_scope(Skill).all
    end
  end

  def new
    @skill = Skill.new
    authorize @skill
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

  def show
    authorize @skill
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
    params.require(:skill).permit(:category_id, :title, :price_per_hour, :earliest_available, :latest_available)
  end
end

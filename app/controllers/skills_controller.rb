class SkillsController < ApplicationController

  def index
    @skills = Skill.all
  end

  def new
    @skills = Skill.new
  end

  def create
    @skills = Skill.new(skill_params)
    if @skill.save
      redirect_to
  end



end

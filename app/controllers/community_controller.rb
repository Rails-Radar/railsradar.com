class CommunityController < ApplicationController
  before_action :set_team

  def index; end

  def show; end

  private

  def set_team
    @team = Team.where(is_community: true).first
  end
end

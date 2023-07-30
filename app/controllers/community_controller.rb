class CommunityController < ApplicationController
  before_action :set_team

  def index
    @kind = params[:kind]&.to_s&.singularize

    @blips = @team.blips.joins(:interesting_thing)
    @blips = @blips.where(interesting_things: { kind: @kind }) if @kind.present?
    # @activity = BlipActivity.where(team: @team).order(created_at: :desc).limit(10)
  end

  def show; end

  def activity
    @activity = BlipActivity.where(team: @team).order(created_at: :desc)
  end

  private

  def set_team
    @team = Team.where(is_community: true).first
  end
end

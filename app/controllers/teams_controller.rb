# frozen_string_literal: true

class TeamsController < ApplicationController
  before_action :authenticate_user!, except: %i[show_community]
  before_action :set_team, only: %i[show edit update destroy]

  # GET /teams or /teams.json
  def index
    @teams = policy_scope(Team)
  end

  # GET /teams/1 or /teams/1.json
  def show
    # You can only view your team or the communities
    # raise 'Not implemented'
  end

  def show_community
    @team = authorize Team.find_by(is_community: true)
    @kind = params[:kind].to_s.singularize
    # raise 'Not implemented' unless %w[tool technique gem platform].include?(@kind)

    @random_thing = InterestingThing.joins(:team).where(kind: @kind, teams: { is_community: true }).sample
    @blips = @team.blips.joins(:interesting_thing).where(interesting_things: { kind: @kind })
    @activity = BlipActivity.where(team: @team).order(created_at: :desc).limit(10)

    @title = "Community #{@kind.titleize}"
    render :show
  end

  def show_team
    @team = current_user.teams.first_or_create do |team|
      team.name = "#{current_user.name}'s team"
      team.is_community = false
      team.users << current_user
    end

    @team = authorize current_user.teams.first

    @random_thing = InterestingThing.joins(:team).where(teams: { is_community: true }).sample
    @kind = params[:kind].to_s.singularize
    @blips = @team.blips.joins(:interesting_thing).where(interesting_things: { kind: @kind })

    @title = "#{@team.name} #{@kind.titleize}"
    render :show
  end

  # GET /teams/new
  def new
    @team = authorize Team.new(users: [current_user])
  end

  # GET /teams/1/edit
  def edit; end

  def vote
    logger.debug vote_params
  end

  # POST /teams or /teams.json
  def create
    @team = Team.new(**team_params, users: [current_user])

    respond_to do |format|
      if @team.save
        format.html { redirect_to team_url(@team), notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1 or /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to team_url(@team), notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1 or /teams/1.json
  def destroy
    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = authorize Team.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def team_params
    params.require(:team).permit(:name)
  end

  def vote_params
    params.require(:vote).permit(:interesting_thing_id, :stage)
  end
end

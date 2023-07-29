class TeamBlipsController < ApplicationController
  before_action :set_team_blip, only: %i[ show edit update destroy ]

  # GET /team_blips or /team_blips.json
  def index
    @team_blips = TeamBlip.all
  end

  # GET /team_blips/1 or /team_blips/1.json
  def show
  end

  # GET /team_blips/new
  def new
    @team_blip = TeamBlip.new
  end

  # GET /team_blips/1/edit
  def edit
  end

  # POST /team_blips or /team_blips.json
  def create
    @team_blip = TeamBlip.new(team_blip_params)

    respond_to do |format|
      if @team_blip.save
        format.html { redirect_to team_blip_url(@team_blip), notice: "Team blip was successfully created." }
        format.json { render :show, status: :created, location: @team_blip }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team_blip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team_blips/1 or /team_blips/1.json
  def update
    respond_to do |format|
      if @team_blip.update(team_blip_params)
        format.html { redirect_to team_blip_url(@team_blip), notice: "Team blip was successfully updated." }
        format.json { render :show, status: :ok, location: @team_blip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team_blip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_blips/1 or /team_blips/1.json
  def destroy
    @team_blip.destroy

    respond_to do |format|
      format.html { redirect_to team_blips_url, notice: "Team blip was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_blip
      @team_blip = TeamBlip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_blip_params
      params.require(:team_blip).permit(:team_id, :name, :description, :stage, :group, :community_blip_id)
    end
end

class CommunityBlipsController < ApplicationController
  before_action :set_community_blip, only: %i[ show edit update destroy ]

  # GET /community_blips or /community_blips.json
  def index
    @community_blips = CommunityBlip.all
  end

  # GET /community_blips/1 or /community_blips/1.json
  def show
  end

  # GET /community_blips/new
  def new
    @community_blip = CommunityBlip.new
  end

  # GET /community_blips/1/edit
  def edit
  end

  # POST /community_blips or /community_blips.json
  def create
    @community_blip = CommunityBlip.new(community_blip_params)

    respond_to do |format|
      if @community_blip.save
        format.html { redirect_to community_blip_url(@community_blip), notice: "Community blip was successfully created." }
        format.json { render :show, status: :created, location: @community_blip }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @community_blip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /community_blips/1 or /community_blips/1.json
  def update
    respond_to do |format|
      if @community_blip.update(community_blip_params)
        format.html { redirect_to community_blip_url(@community_blip), notice: "Community blip was successfully updated." }
        format.json { render :show, status: :ok, location: @community_blip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @community_blip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /community_blips/1 or /community_blips/1.json
  def destroy
    @community_blip.destroy

    respond_to do |format|
      format.html { redirect_to community_blips_url, notice: "Community blip was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community_blip
      @community_blip = CommunityBlip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def community_blip_params
      params.require(:community_blip).permit(:name, :description, :stage, :group)
    end
end

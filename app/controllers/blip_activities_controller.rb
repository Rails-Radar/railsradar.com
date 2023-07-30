class BlipActivitiesController < ApplicationController
  before_action :set_blip_activity, only: %i[ show edit update destroy ]

  # GET /blip_activities or /blip_activities.json
  def index
    @blip_activities = BlipActivity.all
  end

  # GET /blip_activities/1 or /blip_activities/1.json
  def show
  end

  # GET /blip_activities/new
  def new
    @blip_activity = BlipActivity.new
  end

  # GET /blip_activities/1/edit
  def edit
  end

  # POST /blip_activities or /blip_activities.json
  def create
    @blip_activity = BlipActivity.new(blip_activity_params)

    respond_to do |format|
      if @blip_activity.save
        format.html { redirect_to blip_activity_url(@blip_activity), notice: "Blip activity was successfully created." }
        format.json { render :show, status: :created, location: @blip_activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blip_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blip_activities/1 or /blip_activities/1.json
  def update
    respond_to do |format|
      if @blip_activity.update(blip_activity_params)
        format.html { redirect_to blip_activity_url(@blip_activity), notice: "Blip activity was successfully updated." }
        format.json { render :show, status: :ok, location: @blip_activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blip_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blip_activities/1 or /blip_activities/1.json
  def destroy
    @blip_activity.destroy

    respond_to do |format|
      format.html { redirect_to blip_activities_url, notice: "Blip activity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blip_activity
      @blip_activity = BlipActivity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blip_activity_params
      params.require(:blip_activity).permit(:user_id, :team_id, :blip_id, :stage, :event, :comments)
    end
end

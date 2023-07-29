# frozen_string_literal: true

class BlipsController < ApplicationController
  before_action :set_blip, only: %i[show edit update destroy]

  # GET /blips or /blips.json
  def index
    @blips = Blip.all
  end

  # GET /blips/1 or /blips/1.json
  def show; end

  # GET /blips/new
  def new
    @blip = Blip.new
  end

  # GET /blips/1/edit
  def edit; end

  # POST /blips or /blips.json
  def create
    @blip = Blip.new(blip_params)

    respond_to do |format|
      if @blip.save
        format.html { redirect_to blip_url(@blip), notice: 'Blip was successfully created.' }
        format.json { render :show, status: :created, location: @blip }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blips/1 or /blips/1.json
  def update
    respond_to do |format|
      if @blip.update(blip_params)
        format.html { redirect_to blip_url(@blip), notice: 'Blip was successfully updated.' }
        format.json { render :show, status: :ok, location: @blip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blips/1 or /blips/1.json
  def destroy
    @blip.destroy

    respond_to do |format|
      format.html { redirect_to blips_url, notice: 'Blip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_blip
    @blip = Blip.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def blip_params
    params.require(:blip).permit(:interesting_thing_id, :team_id, :stage)
  end
end

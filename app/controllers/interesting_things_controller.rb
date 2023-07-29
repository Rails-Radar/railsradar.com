# frozen_string_literal: true

class InterestingThingsController < ApplicationController
  before_action :set_interesting_thing, only: %i[show edit update destroy]

  # GET /interesting_things or /interesting_things.json
  def index
    @interesting_things = InterestingThing.all
  end

  # GET /interesting_things/1 or /interesting_things/1.json
  def show; end

  # GET /interesting_things/new
  def new
    @interesting_thing = InterestingThing.new
  end

  # GET /interesting_things/1/edit
  def edit; end

  # POST /interesting_things or /interesting_things.json
  def create
    @interesting_thing = InterestingThing.new(interesting_thing_params)

    respond_to do |format|
      if @interesting_thing.save
        format.html do
          redirect_to interesting_thing_url(@interesting_thing), notice: 'Interesting thing was successfully created.'
        end
        format.json { render :show, status: :created, location: @interesting_thing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @interesting_thing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interesting_things/1 or /interesting_things/1.json
  def update
    respond_to do |format|
      if @interesting_thing.update(interesting_thing_params)
        format.html do
          redirect_to interesting_thing_url(@interesting_thing), notice: 'Interesting thing was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @interesting_thing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @interesting_thing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interesting_things/1 or /interesting_things/1.json
  def destroy
    @interesting_thing.destroy

    respond_to do |format|
      format.html { redirect_to interesting_things_url, notice: 'Interesting thing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_interesting_thing
    @interesting_thing = InterestingThing.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def interesting_thing_params
    params.require(:interesting_thing).permit(:name, :description, :kind, :team_id)
  end
end

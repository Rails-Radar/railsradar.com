# frozen_string_literal: true

class BlipStageChanger
  def initialize(blip:, user:, stage:)
    @team = blip.team
    @blip = blip
    @user = user
    @new_stage = stage
    @last_stage = blip.stage
    @comments = comments
  end

  def call
    Blip.transaction do
      @blip.update!(stage: @new_stage)
      BlipActivity.create!(
        team: @team,
        user: @user,
        stage: @new_stage,
        event: compute_event(last_stage: @last_stage, new_stage: @new_stage)
      ).call
    end
    {
      success: true,
      data: blip
    }
  rescue StandardError => e
    {
      success: false,
      error: e
    }
  end

  private

  def compute_event(last_stage:, new_stage:)
    last_stage_int = Blip.stages[last_stage]
    new_stage_int = Blip.stages[new_stage]
    if last_stage_int < new_stage_int
      :demoted
    elsif last_stage_int > new_stage_int
      :promoted
    else
      :confirmed
    end
  end
end

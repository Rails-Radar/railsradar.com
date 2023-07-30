# frozen_string_literal: true

class VoteHandler
  def initialize(interesting_thing:, team:, user:, stage:, comments: nil,
                 blip_stage_changer: BlipStageChanger, blip_creator: BlipCreator)

    @team = team
    @user = user
    @interesting_thing = interesting_thing
    @blip_stage_changer = blip_stage_changer
    @blip_creator = blip_creator
    @stage = stage
    @comments = comments
  end

  def call
    Blip.transaction do
      existing_blip = get_last_blip(team: @team, interesting_thing: @interesting_thing)
      results = create_or_change(existing_blip, @user, @stage)
      raise results[:error] unless results[:success]
    end
    {
      success: true,
      data: ba
    }
  rescue StandardError => e
    {
      success: false,
      errors: e
    }
  end

  private

  def create_or_change(existing_blip, _user, _stage)
    if existing_blip
      @blip_stage_changer.new(
        blip: existing_blip,
        user: @user,
        stage: @stage
      ).call
    else
      @blip_creator = @blip_creator.new(
        team: @team,
        interesting_thing: @interesting_thing,
        stage: @stage
      ).call
    end
  end
end

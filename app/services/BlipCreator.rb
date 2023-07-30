# frozen_string_literal: true

class BlipCreator
  def initialize(team:, interesting_thing:, stage:, blip_activity_creator: BlipActivityCreator)
    @team = team
    @interesting_thing = interesting_thing
    @stage = stage
    @blip_activity_creator = blip_activity_creator
  end

  def call
    blip = Blip.create!(
      interesting_thing: @interesting_thing,
      team: @team,
      stage: @stage,
      radial_noise: generate_radial_noise,
      angular_noise: generate_angular_noise
    )
    {
      success: true,
      data: blip
    }
  rescue StandardError => e
    {
      success: false,
      errors: e
    }
  end

  private

  def generate_radial_noise
    rand
  end

  def generate_angular_noise
    rand - 0.5
  end
end

# frozen_string_literal: true

class BlipCreator
  def initialize(team:, interesting_thing:, stage:, user:)
    @team = team
    @interesting_thing = interesting_thing
    @stage = stage
    @user = user
  end

  def call
    Blip.transaction do
      blip = Blip.create!(
        interesting_thing: @interesting_thing,
        team: @team,
        stage: @stage,
        radial_noise: generate_radial_noise,
        angular_noise: generate_angular_noise
      )

      blip_activity = BlipActivity.create!(
        team: @team,
        user: @user,
        blip:,
        stage: @stage,
        event: :spotted
      )
      {
        success: true,
        data: {
          blip:,
          blip_activity:
        }
      }
    end
  rescue StandardError => e
    {
      success: false,
      error: e
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

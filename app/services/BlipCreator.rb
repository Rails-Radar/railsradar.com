# frozen_string_literal: true

class BlipCreator
  def initialize(team:, interesting_thing:, stage:, user:)
    @team = team
    @interesting_thing = interesting_thing
    @stage = stage
    @user = user
  end

  def call
    puts "Calling Blip Creator"
    Blip.transaction do
      p = next_blip_position(team: @team)
      blip = Blip.create!(
        interesting_thing: @interesting_thing,
        team: @team,
        stage: @stage,
        radial_noise: generate_radial_noise,
        angular_noise: generate_angular_noise,
        position: p
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
    raise e
    {
      success: false,
      error: e
    }
  end

  private

  def next_blip_position(team:)
    last_position = team.blips.maximum(:position)
    (last_position || 0) + 1
  end

  def generate_radial_noise
    1.6 * rand - 0.8
  end

  def generate_angular_noise
    rand
  end
end

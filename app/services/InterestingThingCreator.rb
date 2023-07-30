# frozen_string_literal: true

class InterestingThingCreator
  def initialize(name:, kind:, team:)
    @team = team
    @kind = kind
    @name = name
  end

  def call
    it = InterestingThing.create!(
      name: @name,
      team: @team,
      kind: @kind,
      position: generate_position
    )
    {
      success: true,
      data: it
    }
  rescue StandardError => e
    {
      success: false,
      error: e
    }
  end

  private

  def generate_position
    rand
  end
end

class InterestingThingPolicy < ApplicationPolicy
  def show?
    team_user?
  end

  def new?
    team_user?
  end

  def create?
    team_user?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.joins(:team).where(team: @user.teams)
    end
  end

  private

  def team_user?
    @record&.team&.users&.include?(@user)
  end
end

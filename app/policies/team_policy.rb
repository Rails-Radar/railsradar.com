class TeamPolicy < ApplicationPolicy
  def show_community?
    true
  end

  def show_team?
    team_user?
  end

  def show?
    team_user?
  end

  def create?
    team_user?
  end

  def edit?
    team_user?
  end

  def update?
    team_user?
  end

  def destroy?
    team_user?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(id: user.teams.pluck(:id))
    end
  end

  private

  def team_user?
    @record.users.include?(@user)
  end
end

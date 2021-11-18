class ProfileSitterPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
        scope.all.includes(:user)
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update
    record.user == user
  end

  def destroy?
    record.user == user
  end
end

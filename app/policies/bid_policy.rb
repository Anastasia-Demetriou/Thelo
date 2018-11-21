class BidPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def create?
    true
  end

  def order?
    record.user == user
  end

  def accept?
    true
  end

  private
  def professional?
    user.professional?
  end
end

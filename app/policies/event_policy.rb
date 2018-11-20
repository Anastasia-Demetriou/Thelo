class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
    #only event_organiser
  end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
    #only event_organiser
  end

  def destroy?
    record.user == user
    #only event_organiser
  end

 private

end

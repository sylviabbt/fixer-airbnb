class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def index?
      true
    end

    def create?
      return true
    end
  end
end

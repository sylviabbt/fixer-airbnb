class SkillPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def create?
      true
    end

    def destroy?
      owner_or_admin?
    end

    private

    def owner_or_admin?
      record.user == user || user.admin
    end
  end
end

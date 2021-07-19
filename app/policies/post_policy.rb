class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.has_role? :admin2
        scope.all
      else
        scope.where(content: "")
      end
    end
  end

  def index?
    true
    # false - nobody has access
  end
end

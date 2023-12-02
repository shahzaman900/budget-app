class Ability
  include CanCan::Ability

  def initialize(current_user)
    return unless current_user.present?

    can :manage, [Category, purchase], user: current_user
  end
end

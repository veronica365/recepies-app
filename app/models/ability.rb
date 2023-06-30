class Ability
  include CanCan::Ability

  def initialize(user)
    # No permissions for other users
    can :read, :all
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md

    # additional permissions for administrators
    return unless user.present?

    # additional permissions for logged in users
    can :manage, Food, user: user
    can :manage, Recipe, user: user
    can :manage, RecipeFood, user: user

    return unless user.admin?

    can :manage, :all
  end
end

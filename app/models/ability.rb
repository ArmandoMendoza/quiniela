class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can :read, [Match, Score, Pool]
      can [:read, :update], User, id: user.id
      can [:read, :update], Bet, user_id: user.id
      can :update, Answer, user_id: user.id
    end
  end
end

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can [:show, :results, :bets], Pool do |pool|
        pool.users.include?(user)
      end
      can :read, [Match, Score]
      can [:read, :update], User, id: user.id
      can :read, Bet, user_id: user.id
      can :update, Bet do |bet|
        bet.user_id == user.id && !bet.pool.stopped
      end
      can :update, Answer, user_id: user.id
    end
  end
end

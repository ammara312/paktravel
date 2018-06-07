class Ability
  include CanCan::Ability

  def initialize(user)
    #:manage... any user can manage (perform any action) with a User object. 
    #user must have the same ID as his or her user record does (i.e., users can manage themselves).
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :manage, User, id: user.id #otherwise user can manage user where id = user.id (self manage)
    end
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end

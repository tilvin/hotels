class AccessPolicy
  include AccessGranted::Policy

  def configure
    role :admin, proc { |user| user && user.admin? } do
      can :manage, User
      can :manage, Inn
      can :manage, Room
      can :manage, Comment
      can :manage, Booking
    end

    role :user, proc { |user| user } do
      can :read, Inn
      can :read, Room
      can [:read, :create], Comment
      can [:update, :destroy], Comment do |comment, user|
        comment.user_id == user.id
      end
      can [:read, :create], User
      can [:create], Booking
    end

    role :guest do

    end
  end
end

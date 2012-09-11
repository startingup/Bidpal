class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    user ||= User.new # guest user (not logged in)
       if user.role == "admin"
         can :manage, :all
       else
         can :read, :all
       end
  end
  
  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
end
end

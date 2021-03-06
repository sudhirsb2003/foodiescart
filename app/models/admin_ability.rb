# All back end users (i.e. Active Admin users) are authorized using this class
class AdminAbility
include CanCan::Ability
 
def initialize(user)
user ||= User.new
 
# We operate with three role levels:
# - Editor
# - Moderator
# - Manager
 
# An editor can do the following:
can :manage, Foobar
can :read, SomeOtherModel
 
# A moderator can do the following:
if user.role?('moderator')
can :manage, SomeOtherModel
end
 
# A manager can do the following:
if user.role?('manager')
can :manage, SomeThirdModel
end
end
end

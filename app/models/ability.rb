class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :atendimento
      can :read, Admin::Ticket
      can :create, Admin::Ticket
    end
  end
end

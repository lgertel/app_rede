class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :atendimento
      can :read, Admin::Ticket
      can :create, Admin::Ticket
    elsif user.has_role? :eps
      can :read, Admin::Ticket, id: Admin::Ticket.eps.map{ |ticket| ticket.id }
    end
  end
end

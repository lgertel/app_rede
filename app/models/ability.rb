class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :atendimento
      can :read, Admin::Ticket
      can :create, Admin::Ticket
    elsif user.has_role? :eps
      can :read, Admin::Ticket, id: Admin::Ticket.eps.map{ |ticket| ticket.id }
      can :update, Admin::Ticket, id: Admin::Ticket.eps.map{ |ticket| ticket.id }
    elsif user.has_role? :backoffice
      can :read, Admin::Ticket, id: Admin::Ticket.backoffice.map{ |ticket| ticket.id }
      can :update, Admin::Ticket, id: Admin::Ticket.backoffice.map{ |ticket| ticket.id }
    elsif user.has_role? :n2
      can :read, Admin::Ticket, id: Admin::Ticket.n2.map{ |ticket| ticket.id }
      can :update, Admin::Ticket, id: Admin::Ticket.n2.map{ |ticket| ticket.id }
    end
  end
end

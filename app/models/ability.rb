class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :atendimento
      can :read, Admin::Ticket, id: Admin::Ticket.atendimento.map{ |ticket| ticket.id }
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
    elsif user.has_role? :middleoffice
      can :read, Admin::Ticket, id: Admin::Ticket.middleoffice.map{ |ticket| ticket.id }
      can :create, Admin::Ticket
      can :update, Admin::Ticket, id: Admin::Ticket.middleoffice_update.map{ |ticket| ticket.id }
    elsif user.has_role? :cliente
      can [:read, :update], Admin::Ticket, id: Admin::Ticket.cliente.map{ |ticket| ticket.id }
    elsif user.has_role? :log_interna
      can [:read, :update], Admin::Ticket, id: Admin::Ticket.log_interna.map{ |ticket| ticket.id }
    elsif user.has_role? :log_externa
      can [:read, :update], Admin::Ticket, id: Admin::Ticket.log_externa.map{ |ticket| ticket.id }
    elsif user.has_role? :pservico
      can [:read, :update], Admin::Ticket, id: Admin::Ticket.pservico.map{ |ticket| ticket.id }
    end
  end
end

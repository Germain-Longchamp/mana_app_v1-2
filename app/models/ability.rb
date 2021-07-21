# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud
    if user.present?
      can [:read, :update, :destroy], User, id: user.id
      can :create, User, company_id: user.company_id # a user can create a new user only for its company (maybe not necessary)
      can :crud, Company, id: user.company_id
      can :crud, Engine, company_id: user.company_id
    else
      can :create, User
    end 
  end
end

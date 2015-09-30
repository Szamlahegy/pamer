module Pamer
  class ItemPolicy < Pamer::ApplicationPolicy
    attr_reader :user, :record

    def initialize(user, record)
      @user = user
      @record = record
    end

    def valid?
      !Pamer::Order.find_by(user: @user, orderable: @record).nil?
    end

    def scope
      Pundit.policy_scope!(user, record.class)
    end

    class Scope
      attr_reader :user, :scope

      def initialize(user, scope)
        @user = user
        @scope = scope
      end

      def resolve
        scope
      end
    end
  end
end

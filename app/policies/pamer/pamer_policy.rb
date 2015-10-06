module Pamer
  class PamerPolicy
    #attr_reader :user, :code

    #def initialize(user, code)
    #  @user = user
    #  @code = code
    #end

    def self.valid?(code, user_id, count = 0)
      Pamer::Actualvalue.transaction do
        Pamer::Order.joins(orderrows: :actualvalues).where(user_id: user_id).where('code = ?', code).where('pamer_actualvalues.expires >= ?', Time.now).where('pamer_actualvalues.value >= ?', count).select('pamer_actualvalues.id').pluck('pamer_actualvalues.id').present?
      end
    end

    def self.decrement!(code, user_id, decrement_count = 1, count = 0)
      Pamer::Actualvalue.transaction do
        id = Pamer::Order.joins(orderrows: :actualvalues).where(user_id: user_id).where('code = ?', code).where('pamer_actualvalues.expires >= ?', Time.now).where('pamer_actualvalues.value >= ?', count).select('pamer_actualvalues.id').pluck('pamer_actualvalues.id').first
        if id.nil?
          return false
        else
          Actualvalue.find(id).decrement!(:value, decrement_count)
          return true
        end
      end
    end
  end
end

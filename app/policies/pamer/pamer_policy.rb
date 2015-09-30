module Pamer
  class PamerPolicy
    attr_reader :user, :code

    def initialize(user, code)
      @user = user
      @code = code
    end

    def valid?
      return Actualvalue.joins(:order).where('user_id = ?', @user.id).where('expires >= ?', Time.now).where('code = ?', @code).where('value > 0 OR value = -1 OR value = -2').exists?
    end

    def decrement!
      return Actualvalue.joins(:order).where('user_id = ?', @user.id).where('expires >= ?', Time.now).where('code = ?', @code).take.try(:decrement!, :value)
    end
  end
end

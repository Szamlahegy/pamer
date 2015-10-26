module Pamer
  #
  # Class PamerPolicy provides Queries for Pamer
  #
  # @author Joe Blog <Joe.Blog@nowhere.com>
  #
  class PamerPolicy
    def valid?(code, user_id, count = 0)
      Pamer::Actualvalue.transaction do
        my_actualvalues(user_id, code, count).present?
      end
    end

    def decrement!(code, user_id, decrement_count = 1, count = 0)
      Pamer::Actualvalue.transaction do
        av = my_actualvalues(user_id, code, count).first
        if av.nil?
          return false
        else
          Actualvalue.find(av.id).decrement!(:value, decrement_count)
          return true
        end
      end
    end

    #
    # Returns the package ids of the given user
    #
    # @param [User] user Package owner
    #
    # @return [Array] My package ids
    #
    def my_packages(user)
      user.orders.joins(:orderrows)
        .where("orderable_type = 'Pamer::Package'")
        .joins('left join pamer_packages on pamer_packages.id = pamer_orderrows.orderable_id')
        .where('pamer_orderrows.expires is null or pamer_orderrows.expires > ?', Time.now)
        .where('pamer_orderrows.state = ?', :completed)
    end

    def my_packages_ids(user)
      my_packages(user).pluck('pamer_packages.id')
    end

    def orders_with_changegroup(changegroup)
      Pamer::Order.joins(:orderrows)
        .where("orderable_type = 'Pamer::Package'")
        .joins('left join pamer_packages on pamer_packages.id = pamer_orderrows.orderable_id')
        .where('pamer_packages.changegroup = (?)', changegroup)
    end

    def my_actualvalues(user, code = nil, count = nil)
      Pamer::Actualvalue
        .joins(:orderrow)
        .where('pamer_actualvalues.id IN (?)', my_actualvalues_ids(user, code, count))
        .where('pamer_orderrows.expires is null or pamer_orderrows.expires > ?', Time.now)
        .where('pamer_orderrows.state = ? or pamer_orderrows.state = ?', :completed, :changed)
    end

    def my_actualvalues_ids(user, code = nil, count = nil)
      result = Pamer::Order
               .joins(orderrows: :actualvalues)
               .where(user_id: user.id)
               .where('pamer_actualvalues.expires is null or pamer_actualvalues.expires >= ?', Time.now)
               .select('pamer_actualvalues.id')
      result = result.where('code = ?', code) if code
      result = result.where('pamer_actualvalues.value > ?', count) if count
      result.pluck('pamer_actualvalues.id')
    end
  end
end

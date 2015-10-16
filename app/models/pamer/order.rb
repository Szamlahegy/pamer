module Pamer
  #
  # When a user buys a Package or and Item
  #
  class Order < ActiveRecord::Base
    belongs_to :user
    has_many :orderrows,
             dependent: :destroy

    accepts_nested_attributes_for :orderrows,
                                  reject_if: :all_blank,
                                  allow_destroy: true

    def make_expired!
      Order.transaction do
        orderrows.find_each do |orderrow|
          orderrow.state = Pamer::Orderrow.state.changed
          orderrow.save!
        end
      end
    end

    def price
      sum = BigDecimal.new(0)
      orderrows.each do |orderrow|
        price = orderrow.orderable.prices.find_by_price_currency('HUF').price
        sum = sum + price.amount
      end
      sum.to_f
    end

    def set_state(state)
      Order.transaction do
        orderrows.each do |orderrow|
          orderrow.state = state
          orderrow.save!
        end
      end
    end
  end
end

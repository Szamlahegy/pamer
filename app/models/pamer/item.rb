module Pamer
  class Item < ActiveRecord::Base
    has_many :items_packages
    has_many :packages, through: :items_packages
    has_many :prices, as: :priceable

    # Creates actualvalues after creating an order
    # Orderable must contain a code field
    def create_actualvalues(orderrow)
      if count > 0
        av = Pamer::Actualvalue.create!(expires: expires, value: count, orderrow: orderrow, code: item.code)
      end
    end

    #
    def xxx

    end
  end
end

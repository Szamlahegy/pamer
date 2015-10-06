module Pamer
  class Package < ActiveRecord::Base
    has_many :items_packages
    has_many :items, through: :items_packages
    has_many :prices, as: :priceable

    # Creates actualvalues after creating an order
    # Orderable must contain a code field
    def create_actualvalues(orderrow)
      items_packages.find_each do |items_package|
        # We count the amount
        if items_package.quantity > 0
          Pamer::Actualvalue.create!(expires: expires, value: items_package.quantity, orderrow: orderrow, code: items_package.item.code)
        end
      end
    end
  end
end

module Pamer
  class Package < ActiveRecord::Base
    has_many :items_packages
    has_many :items, through: :items_packages
    has_many :prices, as: :priceable

    # Creates actualvalues after creating an order
    # Orderable must contain a code field
    def create_actualvalues(order)
      items_packages.find_each do |items_package|
        # We count the amount
        if items_package.count > 0
          av = Pamer::Actualvalue.create!(value: items_package.count, order: order, code: items_package.item.code)
        end
      end
    end

    #
    def is_valid_for(code)

    end
  end
end

# csomi
# 5
# email :email

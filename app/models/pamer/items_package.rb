module Pamer
  class ItemsPackage < ActiveRecord::Base
    belongs_to :package
    belongs_to :item
    has_many :actualvalues

    accepts_nested_attributes_for :item

    # Creates actualvalues after creating an order
    # Orderable must contain a code field
    def create_actualvalues(orderrow)
      if quantity > 0
        av = Pamer::Actualvalue.create!(expires: expires, value: quantity, orderrow: orderrow, code: item.code)
      end
    end
  end
end

module Pamer
  #
  # Belongs to Package and contains the properties of the belonging Item.
  #
  class ItemsPackage < ActiveRecord::Base
    belongs_to :package
    belongs_to :item, dependent: :destroy
    has_many :actualvalues

    accepts_nested_attributes_for :item

    def name
      item.name
    end

    def description
      item.description
    end

    def expires_calculated
      if repeatable && !expires_time && !expires_unit
        expires_time.send(expires_unit)
      elsif !package
        package.expires_calculated
      end
    end

    # Creates actualvalues after creating an order
    # Orderable must contain a code field
    def create_actualvalues(orderrow)
      Pamer::Actualvalue.create!(
        # TODO: no expired field for item...
        expires: Time.now + expires_time.send(expires_unit),
        value: quantity,
        orderrow: orderrow,
        code: item.code,
        description: "#{name} (#{package.name})"
      ) if quantity > 0
    end
  end
end

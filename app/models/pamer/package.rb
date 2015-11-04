module Pamer
  #
  # User can buy a Package which contains Items through ItemsPackage
  #
  class Package < ActiveRecord::Base
    has_many :items_packages, dependent: :destroy
    has_many :items, through: :items_packages, dependent: :destroy
    has_many :prices, as: :priceable

    accepts_nested_attributes_for :prices,
                                  reject_if: :all_blank, allow_destroy: true

    validates :name, presence: true
    validates :changegroup, presence: true
    validates :expires_time, numericality: {
      only_integer: true, greater_than: 0
    }
    validates :expires_unit, inclusion: {
      in: %w(day week month year)
    }, presence: false

    def expires_calculated
      expires_time.send(expires_unit)
    end
    # Creates actualvalues after creating an order
    # Orderable must contain a code field
    def create_actualvalues(orderrow)
      items_packages.find_each do |items_package|
        # We count the amount
        if !items_package.quantity.nil? && items_package.quantity > 0
          Pamer::Actualvalue.create!(
            expires: Time.now + expires_calculated,
            value: items_package.quantity,
            orderrow: orderrow,
            code: items_package.item.code,
            description: "#{items_package.item.name} (#{name})"
          )
        end
      end
    end
  end
end

module Pamer
  class Price < ActiveRecord::Base
    monetize :price_cents

    belongs_to :priceable, polymorphic: true
  end
end

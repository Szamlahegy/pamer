module Pamer
  class Price < ActiveRecord::Base
    belongs_to :priceable, polymorphic: true
  end
end

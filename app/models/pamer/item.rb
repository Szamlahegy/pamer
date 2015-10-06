module Pamer
  class Item < ActiveRecord::Base
    has_many :items_packages
    has_many :packages, through: :items_packages
    has_many :prices, as: :priceable
  end
end

module Pamer
  class ItemsPackage < ActiveRecord::Base
    belongs_to :package
    belongs_to :item
    has_many :actualvalues

    accepts_nested_attributes_for :item
  end
end

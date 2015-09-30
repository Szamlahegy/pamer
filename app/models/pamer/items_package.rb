module Pamer
  class ItemsPackage < ActiveRecord::Base
    belongs_to :package
    belongs_to :item
    has_many :actualvalues
  end
end

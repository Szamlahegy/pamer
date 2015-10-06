module Pamer
  class Actualvalue < ActiveRecord::Base
    #belongs_to :items_packages
    belongs_to :orderrow
  end
end

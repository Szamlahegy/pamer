module Pamer
  class Order < ActiveRecord::Base
    belongs_to :orderable, polymorphic: true
    belongs_to :user
    has_many :actualvalues

    after_save :create_actualvalues

    def create_actualvalues
      orderable.create_actualvalues(self) if orderable.class.method_defined?(:create_actualvalues)
    end
  end
end

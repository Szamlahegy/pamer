module Pamer
  class Order < ActiveRecord::Base
    belongs_to :user
    has_many :orderrows, dependent: :destroy

    accepts_nested_attributes_for :orderrows, reject_if: :all_blank, allow_destroy: true

  end
end

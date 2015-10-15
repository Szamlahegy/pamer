module Pamer
  #
  # When a user buys a Package or and Item
  #
  class Order < ActiveRecord::Base
    belongs_to :user
    has_many :orderrows,
             dependent: :destroy

    accepts_nested_attributes_for :orderrows,
                                  reject_if: :all_blank,
                                  allow_destroy: true

    def make_expired!
      Order.transaction do
        orderrows.find_each do |orderrow|
          orderrow.expires = Time.now
          orderrow.save!
        end
      end
    end
  end
end

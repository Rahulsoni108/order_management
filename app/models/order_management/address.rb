module OrderManagement
  class Address < ApplicationRecord
    self.table_name = "addresses"

    belongs_to :user
    has_many :orders
  end
end

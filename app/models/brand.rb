class Brand < ApplicationRecord
  acts_as_paranoid
  self.table_name = "brand"
end

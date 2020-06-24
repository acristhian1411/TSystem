class Category < ApplicationRecord
  acts_as_paranoid
  self.table_name = "category"
  validates :cat_descript, presence: true

end

class SubCategory < ApplicationRecord
  acts_as_paranoid
  self.table_name = "sub_category"
  belongs_to :category, optional: true
  validates :sub_cat_descrip, presence: true
  validates :cat_id, presence: true
end

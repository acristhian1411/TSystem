class City < ApplicationRecord
  acts_as_paranoid
  self.table_name = "city"
  validates :city_descrip, presence: true

end

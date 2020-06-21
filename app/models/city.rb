class City < ApplicationRecord
  self.table_name = "city"
  validates :city_descrip, presence: true

  

end

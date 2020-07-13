class Person < ApplicationRecord
  belongs_to :district
  self.table_name = "person"

end

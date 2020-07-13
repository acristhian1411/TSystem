class Provider < Person
  belongs_to :district, optional: true
  self.table_name = "provider"

end

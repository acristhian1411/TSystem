class Provider < Person
  acts_as_paranoid
  belongs_to :district, optional: true
  self.table_name = "provider"
  validates :district_id, presence: true
  validates :nombre, presence: true
  validates :last_name, presence: true
  validates :cedula, presence: true
  validates :ruc, presence: true
  validates :home_address, presence: true
  validates :business_name, presence: true

end

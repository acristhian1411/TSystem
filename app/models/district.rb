class District < ApplicationRecord
  belongs_to :city
  acts_as_paranoid
  validates :district_descrip, presence: true

end

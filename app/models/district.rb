class District < ApplicationRecord
  acts_as_paranoid
  belongs_to :city
  validates :district_descrip, presence: true

end

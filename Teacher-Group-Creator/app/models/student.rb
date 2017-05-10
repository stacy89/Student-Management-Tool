class Student < ApplicationRecord
  belongs_to :teacher

  validates :name, :phase, :emergency_contact_name, :emergency_contact_num, {presence: true}
end

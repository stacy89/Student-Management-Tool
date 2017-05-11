class Student < ApplicationRecord
  belongs_to :teacher, optional: true

  validates :name, :phase, :emergency_contact_name, :emergency_contact_num, {presence: true}
end

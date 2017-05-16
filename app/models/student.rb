class Student < ApplicationRecord
  belongs_to :teacher, optional: true

  validates :name, :phase, :emergency_contact_name, :emergency_contact_num, {presence: true}
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end

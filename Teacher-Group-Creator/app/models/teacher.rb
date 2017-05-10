class Teacher < ApplicationRecord
  has_many :students

  validates :name, :email, :admin_status, :password, {presence: true}
  validates :email, {uniqueness: true}
  has_secure_password
end

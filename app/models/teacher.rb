class Teacher < ApplicationRecord
  has_many :students

  validates :name, :email, :admin_status, :password, {presence: true}
  validates :email, {uniqueness: true}
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_secure_password

  def group_by(number_of_students_per_group, criteria)
    number_of_groups = self.students.count/number_of_students_per_group
    final_group = []
    number_of_groups.times do
      final_group << []
    end
    ordered_students = self.students.order("#{criteria}": :desc)

    group_number = 0
    ordered_students.each do |student|
      if group_number > number_of_groups - 1
        group_number = 0
        final_group[group_number] << student
      else
      final_group[group_number] << student
      end
        group_number += 1
    end
    final_group
  end
end

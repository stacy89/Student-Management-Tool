# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Student.destroy_all
Teacher.destroy_all

genders = ["male", "female", "non-binary"]
diets = ["none", "vegetarian", "vegan"]
shirt = ["XS", "S", "M", "L", "XL", "XXL"]

5.times do
  teacher = Teacher.new
  teacher.name = Faker::GameOfThrones.character
  teacher.email = Faker::Internet.email
  teacher.phone = "+" + Faker::Number.number(10).to_s
  teacher.admin_status = Faker::Number.between(0, 3)
  teacher.password = "password"
  teacher.save
end

50.times do
  student = Student.new
  student.name = Faker::Name.name
  student.phase = Faker::Number.between(0, 3)
  student.gender = genders.shuffle.first
  student.gpa = (Faker::Number.between(1, 4).to_f + Faker::Number.decimal(2).to_f)
  student.num_detentions = Faker::Number.between(0, 10)
  student.shirt_size = shirt.shuffle.first
  student.dietary_restrictions = diets.shuffle.first
  student.emergency_contact_name = Faker::Name.name
  student.emergency_contact_num = Faker::Number.number(10)
  student.teacher_id = Faker::Number.between(1, 5)
  student.save
end



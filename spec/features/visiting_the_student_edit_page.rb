require 'rails_helper'

feature "visiting the student edit page" do
  scenario "A teacher will be about to change student info" do
    student = Student.create(name: 'Stacy', phase: 3, emergency_contact_name: 'Anthony', emergency_contact_num: '1234' )
    visit "/students/#{student.id}/edit"
    expect(page).to have_current_path edit_student_path(student.id)
  end
end

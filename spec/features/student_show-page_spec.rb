require 'rails_helper'

feature "visiting the student show page" do
  scenario "the teacher will see info about a specific student" do
    student = Student.create(name: 'Stacy', phase: 3, emergency_contact_name: 'Anthony', emergency_contact_num: '1234' )
    visit "/students/#{student.id}"
    expect(page).to have_current_path student_path(student.id)
  end
end




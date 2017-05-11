require 'rails_helper'

feature "visiting the homepage" do
  scenario "the teacher sees a list of all student" do
    visit "/"
    expect(page).to have_current_path root_path
  end
end

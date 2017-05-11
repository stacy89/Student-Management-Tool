require 'rails_helper'

describe StudentsController do
  let!(:teacher) { Teacher.create(name: "Ken", email: "ken@dbc", admin_status: 2, password: "password")}
  let!(:student) { Student.create(name: "Stacy", phase: 3, emergency_contact_name: "Antony", emergency_contact_num: "1234", teacher_id: 1) }

  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      expect(response).to have_http_status 200
    end

    it "assigns the students as @students" do
      get :index
      expect(assigns(:students)).to eq Student.all
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end
end

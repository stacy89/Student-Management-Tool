require 'rails_helper'

describe StudentsController do
  let!(:teacher) { Teacher.create(name: "Ken", email: "ken@dbc", admin_status: 2, password: "password")}
  let!(:student) { Student.create(name: "Stacy", phase: 3, emergency_contact_name: "Antony", emergency_contact_num: "1234", teacher_id: teacher.id) }

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

    describe "GET #show" do
    it "responds with status code 200" do
      get :show, {id: student.id }
      expect(response).to have_http_status 200
    end

    it "assigns the student as @student" do
      get :show, {id: student.id }
      expect(assigns(:student)).to eq student
    end

    it "renders the :show template" do
      get :show, {id: student.id }
      expect(response).to render_template(:show)
    end
  end

    describe "GET #edit" do
    it "responds with status code 302" do
      get :edit, {id: student.id }
      expect(response).to have_http_status 302
    end

    it "assigns the student as @student" do
      get :edit, {id: student.id }
      expect(assigns(:student)).to eq student
    end

    it "renders the :edit template" do
      session[:id] = student.teacher_id
      get :edit, {id: student.id }
      expect(response).to render_template(:edit)
    end
  end

    describe "PUT #update" do
    it "responds with status code 302" do
      put :update, {id: student.id, student: student.attributes }
      expect(response).to have_http_status 302
    end

    it "assigns the student as @student" do
      put :update, {id: student.id, student: student.attributes }
      expect(assigns(:student)).to eq student
    end

    it "redirects to the root_path when saved" do
      session[:id] = student.teacher_id
      put :update, {id: student.id, student: student.attributes }
      expect(response).to redirect_to(root_path)
    end
  end

  describe "GET #nonpicked" do
    it "responds with status code 200" do
      get :nonpicked, {id: student.id }
      expect(response).to have_http_status 200
    end

    it "show all students that have not been picked" do
      get :nonpicked, {id: student.id }
      expect(assigns(:students)).to eq nil
    end

    it "renders the :nonpicked template" do
      get :nonpicked, {id: student.id }
      expect(response).to render_template(:nonpicked)
    end
  end
end

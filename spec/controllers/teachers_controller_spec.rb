
require 'rails_helper'

describe TeachersController do
  let!(:teacher) {Teacher.create!(name: "Hagrid", email: "bob@bob.com", admin_status: 1, password: "password" )}

  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      expect(response).to have_http_status 200
    end

    it "assigns the all teachers as @teachers" do
      get :index
      expect(assigns(:teachers)).to eq Teacher.all
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, { id: teacher.id }
      expect(response).to have_http_status 200
    end


    it "assigns the correct teacher as @teacher" do
      get :show, { id: teacher.id }
      expect(assigns(:teacher)).to eq(teacher)
    end

    it "renders the :show template" do
      get :show, { id: teacher.id }
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "responds with status code 200" do
      get :new
      expect(response).to have_http_status 200
    end

    it "assigns a new teacher to @teacher" do
      get :new
      expect(assigns(:teacher)).to be_a_new Teacher
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      it "responds with status code 302" do
        post :create, { teacher: {name: "Snape", email: "snape@snape.com", admin_status: 1, password: "password"} }
        expect(response).to have_http_status 302
      end
    end

    it "creates a new teacher in the database" do
      count_before = Teacher.all.count
      post :create, { teacher: {name: "Snape", email: "snape@snape.com", admin_status: 1, password: "password"} }
      expect(count_before).to eq Teacher.all.count-1
    end

    it "assigns the newly created teacher as @teacher" do
      post :create, { teacher: {name: "Snape", email: "snape@snape.com", admin_status: 1, password: "password"} }
      expect(assigns(:teacher)).to eq Teacher.last
    end
    it "redirects to the home page" do
      post :create, { teacher: {name: "Snape", email: "snape@snape.com", admin_status: 1, password: "password"} }
      expect(response).to redirect_to students_path
    end
  end

  describe "When invalid params are passed" do
   it "responds with status code 406: Not Acceptable" do
    post :create, { teacher: {email: 1, admin_status: 1, password: "password"} }
    expect(response).to have_http_status 406
  end

  it "does not create a new teacher in the database" do
    count_before = Teacher.all.count
    post :create, { teacher: { email: 1, admin_status: 1, password: "password"} }
    expect(count_before).to eq Teacher.all.count
  end

  it "assigns the unsaved teacher as @teacher" do
    post :create, { teacher: {email: 1, admin_status: 1, password: "password"} }
    expect(assigns(:teacher)).to be_an_instance_of Teacher
  end

  it "renders the :new template" do
    post :create, { teacher: {email: 1, admin_status: 1, password: "password"} }
    expect(response).to render_template(:new)
  end
end

end


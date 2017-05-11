<<<<<<< HEAD
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
  end
end
=======
>>>>>>> 036d0185b6f8a1cdeb47a38db96ebf2e4246ddfc

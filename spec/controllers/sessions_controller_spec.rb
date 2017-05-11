require 'rails_helper'

describe SessionsController do
  let!(:teacher) {Teacher.create!(name: "Hagrid", email: "bob@bob.com", admin_status: 1, password: "password" )}

  describe "POST #create" do
    context "when valid params are passed" do
      it "session does not equal nil" do
        post :create, { "session" => {"email" => "bob@bob.com", "password" => "password"}}
        expect(session[:id]).to_not be nil
      end
    end

    context "when invalid params are passed" do
      it "renders the :new template" do
        post :create, { "session" => {"email" => "bob@bob.com", "password" => "pasfwefword"}}
        expect(response).to render_template(:new)
      end
    end
  end



end

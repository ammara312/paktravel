require 'rails_helper'

describe UsersController, type: :controller do

  before do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
  end

  describe 'GET #show' do
  	#first the context is if the user is logged in then ..
    context 'when a user is logged in' do
      before do
        sign_in @user
    	end
      it 'loads correct data for user details' do
        get :show, params: { id: @user.id }
        expect(assigns(:user)).to eq @user
        expect(response).to be_ok
      end
      it 'cannot access other users show page' do
        get :show, params: { id: @user2.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
    # second case is when a user is not logged in ...

   context 'when a user is not logged in' do
     it 'redirects to login' do
       get :show, params: { id: @user.id }
       expect(response).to redirect_to(new_user_session_path)
     end
   end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new user" do
        expect{
          post :create, params: { user: FactoryBot.create(:user) }
        }.to change(User,:count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not create a new user" do
        expect{
          post :create, params: { user: FactoryBot.create(:user, password: "hi") }
        }.to raise_error(/Password is too short/)
      end
    end
  end
end
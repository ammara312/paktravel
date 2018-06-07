require 'rails_helper'

#index action
describe ProductsController, type: :controller do
  context 'GET #index' do
    it 'renders the index page' do 
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  #show action
  context 'GET #show' do
    it 'renders the show page' do 
      @product = FactoryBot.create(:product)
      get :show, params: {id: @product}
      expect(response).to be_ok
      expect(response).to render_template('show')
    end
  end  

  # Create action
  context "POST #create" do
    before do 
      @user = FactoryBot.build(:user)
      sign_in @user
    end
    it "successfully creates new product" do  
      @product = FactoryBot.create(:product)
      expect(response).to be_successful
    end
    it "cannot create a product" do 
       expect(Product.new(price:nil)).not_to be_valid
    end  
  end  


  #delete action
  context "delete" do 
    before do 
      @product = FactoryBot.create(:product)
      @user = FactoryBot.create(:user)
      sign_in @user
    end
    it "allows admin to delete a product" do 
      delete :destroy, params: {id: @product}
      expect(response).to redirect_to products_path
    end
  end 
end
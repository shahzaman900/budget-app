require 'rails_helper'

RSpec.describe 'purchasess', type: :request do
  context 'GET /index' do
    before :all do
      Purchase.delete_all
      Category.delete_all
      User.delete_all

      @user = User.create(id: 1, name: 'User', surname: 'one', email: 'test@gmail.com', password: '123456')
      @category = Category.create(id: 1, user: @user, name: 'Category one', icon: 'default-image.jpg')
    end

    it 'returns http success' do
      sign_in @user
      get category_purchases_path(@category)
      expect(response).to have_http_status(:success)
    end

    it 'renders index view' do
      sign_in @user
      get category_purchases_path(@category)
      expect(response).to render_template(:index)
    end

    it 'renders content from the view' do
      sign_in @user
      get category_purchases_path(@category)
      expect(response.body).to include('purchaseS')
    end
  end

  context 'GET /show' do
    before :all do
      Purchase.delete_all
      Category.delete_all
      User.delete_all

      @user = User.create(id: 1, name: 'User', surname: 'one', email: 'test@gmail.com', password: '123456')
      @category = Category.create(id: 1, user: @user, name: 'Category one', icon: 'default-image.jpg')
      @purchase = Purchase.create(name: 'purchase one', amount: 10, author: @user)
      @purchase.categories << @category
    end

    it 'returns http success' do
      sign_in @user
      get category_purchase_path(@category, @purchase)
      expect(response).to have_http_status(:success)
    end

    it 'renders index view' do
      sign_in @user
      get category_purchase_path(@category, @purchase)
      expect(response).to render_template(:show)
    end

    it 'renders content from the view' do
      sign_in @user
      get category_purchase_path(@category, @purchase)
      expect(response.body).to include('DETAILS')
    end
  end

  context 'GET /new' do
    before :all do
      Purchase.delete_all
      Category.delete_all
      User.delete_all

      @user = User.create(id: 1, name: 'User', surname: 'one', email: 'test@gmail.com', password: '123456')
      @category = Category.create(id: 1, user: @user, name: 'Category one', icon: 'default-image.jpg')
      @purchase = Purchase.create(name: 'purchase one', amount: 10, author: @user)
      @purchase.categories << @category
    end

    it 'returns http success' do
      sign_in @user
      get new_category_purchase_path(@category)
      expect(response).to have_http_status(:success)
    end

    it 'renders index view' do
      sign_in @user
      get new_category_purchase_path(@category)
      expect(response).to render_template(:new)
    end

    it 'renders content from the view' do
      sign_in @user
      get new_category_purchase_path(@category)
      expect(response.body).to include('purchase')
    end
  end
end

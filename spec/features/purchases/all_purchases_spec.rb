require 'rails_helper'

RSpec.describe 'purchase', type: :system do
  before :all do
    purchase.delete_all
    Category.delete_all
    User.delete_all

    @user = User.create(id: 1, name: 'User', surname: 'one', email: 'test@gmail.com', password: '123456')
    @category = Category.create(id: 1, user: @user, name: 'Category one', icon: 'default-image.jpg')
    @purchase = purchase.create(name: 'purchase one', amount: 10, author: @user)
    @purchase.categories << @category
    @purchase2 = purchase.create(name: 'purchase two', amount: 10, author: @user)
    @purchase2.categories << @category
    @purchase3 = purchase.create(name: 'purchase three', amount: 10, author: @user)
    @purchase3.categories << @category
  end

  context '#all_purchases view' do
    it 'should render all_purchase details' do
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      sleep(1)
      visit all_purchases_path
      sleep(1)
      expect(page).to have_content('BudgetMap')
      expect(page).to have_content('Total Budget: $30.0')
      expect(page).to have_content('purchase one')
      expect(page).to have_content('purchase two')
      expect(page).to have_content('purchase three')
      expect(page).to have_content(@purchase.created_at.strftime('%d %b %Y').to_s)
      expect(page).to have_content(@purchase2.created_at.strftime('%d %b %Y').to_s)
      expect(page).to have_content(@purchase3.created_at.strftime('%d %b %Y').to_s)
    end
  end
end

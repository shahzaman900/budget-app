require 'rails_helper'

RSpec.describe purchase, type: :model do
  before :all do
    purchase.delete_all
    Category.delete_all
    User.delete_all

    @user = User.create(id: 1, name: 'User', surname: 'one', email: 'test@gmail.com', password: '123456')
    @category = Category.create(id: 1, user: @user, name: 'Category one', icon: 'default-image.jpg')
    @purchase = purchase.create(name: 'purchase one', amount: 10, author: @user)
    @purchase.categories << @category
  end

  context '#create valid instance' do
    it 'purchase' do
      expect(@purchase).to be_valid
    end

    it 'not valid if no user association' do
      purchase = purchase.create(name: 'purchase two', amount: 10)
      expect(purchase).not_to be_valid
    end
  end

  context 'Attribute validations' do
    it 'name should be present' do
      purchase = purchase.create(amount: 10, author: @user)
      expect(purchase).not_to be_valid
    end

    it 'amount should be present' do
      purchase = purchase.create(name: 'purchase two', author: @user)
      expect(purchase).not_to be_valid
    end

    it 'Name should be below 100 chars' do
      purchase = purchase.create(name: 'purchase two' * 10, amount: 10, author: @user)
      expect(purchase).not_to be_valid
    end

    it 'Amount should be a positive number' do
      purchase = purchase.create(name: 'purchase two', amount: -10, author: @user)
      expect(purchase).not_to be_valid
    end
  end
end

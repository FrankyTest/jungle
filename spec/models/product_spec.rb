require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before(:each) do
      @furniture = Category.create(name: 'Furniture')
    end

    it 'should validate presence of name, price, quantity, and category' do
      @chair = Product.create(
        name: 'Chair',
        price: 300,
        quantity: 12,
        category: @furniture)

      expect(@chair).to be_valid
    end

    it 'should test absence of name' do
      @chair = Product.create(
        name: nil,
        price: 300,
        quantity: 12,
        category: @furniture)

      expect(@chair).to be_invalid
    end

    it 'should test absence of price' do
      @chair = Product.create(
        name: 'Chair',
        price: nil,
        quantity: 12,
        category: @furniture)

      expect(@chair).to be_invalid
    end

    it 'should test absence of quantity' do
      @chair = Product.create(
        name: 'Chair',
        price: 300,
        quantity: nil,
        category: @furniture)

      expect(@chair).to be_invalid
    end

    it 'should test absence of category' do
      @chair = Product.create(
        name: 'Chair',
        price: 300,
        quantity: 12,
        category: nil)

      expect(@chair).to be_invalid
    end

  end
end

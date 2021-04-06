require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should check if product name is present' do
      @category = Category.new :name => "Material"
      @product = Product.new(
        :name => nil, 
        :price => 200, 
        :quantity => 4, 
        :category => @category 
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it 'should check if product price is present' do
      @category = Category.new :name => "Material"
      @product = Product.new(
        :name => "iPod Nano", 
        :price => nil, 
        :quantity => 4, 
        :category => @category 
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it 'should check if product quantity is present' do
      @category = Category.new :name => "Material"
      @product = Product.new(
        :name => "iPod Nano", 
        :price => 200, 
        :quantity => nil, 
        :category => @category 
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it 'should check if product category is present' do
      @category = Category.new :name => "Material"
      @product = Product.new(
        :name => "iPod Nano", 
        :price => 200, 
        :quantity => 4, 
        :category => nil 
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end

  end
end
require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should be able to save a new product' do
      @category = Category.create name: "Flower" 
      @products = @category.products.create ({name: 'rose', price: 10, quantity: 5})
      @products.save

      expect(Product.all.first.name).to eq("rose") 
    end

    it 'should have a category' do 
      @category = Category.create name: "Flower"
      @product = Product.create ({ name: 'rose', price: 10, quantity: 5})
      
      expect(@product.errors.full_messages).to eq ["Category must exist", "Category can't be blank"] 
    end

    it 'should have a name' do 
      @category = Category.create name: "Flower" 
      @products = @category.products.create ({price: 10, quantity: 5})

      expect(@products.errors.full_messages).to eq ["Name can't be blank"] 
    end

    it 'should have a price' do 
      @category = Category.create name: "Flower" 
      @products = @category.products.create ({name: 'rose', quantity: 5})

      expect(@products.errors.full_messages).to eq ["Price cents is not a number", "Price is not a number", "Price can't be blank"] 
    end

    it 'should have a quantity set' do 
      @category = Category.create name: "Flower" 
      @products = @category.products.create ({ name: 'rose', price: 10})

      expect(@products.errors.full_messages).to eq ["Quantity can't be blank"] 
    end
   
  end
end

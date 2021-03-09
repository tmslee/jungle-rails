require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @category = Category.new({name: "newCat"})
    @category.save
    @params = {
      name: "newProduct",
      price: 100.25,
      quantity: 20,
      category: @category
    }
  end

  describe 'Validations' do
    it "should save when all fields are present" do
      product = Product.new(@params)
      expect(product.save).to be(true)
    end
    it "should not save when name is missing" do
      @params[:name] = nil
      product = Product.new(@params)
      product.save
      expect(product.errors.full_messages).to include("Name can't be blank")
    end
    it "should not save when price is missing" do
      @params[:price] = nil
      product = Product.new(@params)
      product.save
      expect(product.errors.full_messages).to include("Price can't be blank")
    end
    it "should not save when quantity is missing" do
      @params[:quantity] = nil
      product = Product.new(@params)
      product.save
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end
    it "should not save when catagory is missing" do
      @params[:category] = nil
      product = Product.new(@params)
      product.save
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end

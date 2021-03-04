class Admin::DashboardController < ApplicationController
  def show
    @num_product = Product.count
    @num_cat = Category.count
  end
end

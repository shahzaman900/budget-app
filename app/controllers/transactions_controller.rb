class TransactionController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @transaction = @category.categoriestabels
  end
end

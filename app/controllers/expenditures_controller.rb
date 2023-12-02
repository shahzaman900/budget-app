class purchasesController < ApplicationController
  def index
    @purchases_nav = true
    @category = Category.includes(:purchases).find(params[:category_id])
    @purchases = @category.purchases.order(created_at: :desc)
  end

  def show
    @each_purchase_nav = true
    @category = Category.includes(:purchases).find(params[:category_id])
    @purchase = @category.purchases.includes(:categories).find(params[:id])
  end

  def new
    @new_purchase_nav = true
    @category = Category.find(params[:category_id])
    @purchase = purchase.new
    @current_category_id = @category.id
  end

  def create
    @purchase = purchase.new(purchase_params.except(:category_ids))
    @purchase.author = current_user
    @categories = Category.where(id: purchase_params[:category_ids])
    @categories.each do |category|
      @purchase.categories << category
    end
    if @purchase.save
      flash[:success] = 'Successfully added New purchase.'
      redirect_to category_purchases_path(params[:category_id])
    else
      flash.now[:error] = 'Error: Failed to Add new purchase!'
      render :new
    end
  end

  def destroy
    @purchase = current_user.purchases.find(params[:id])

    if @purchase.destroy
      flash[:success] = 'Successfully delete the purchase.'
      redirect_to category_purchases_path(params[:category_id])
    else
      flash[:error] = 'Error: Failed to delete the purchase!'
      render :show
    end
  end

  def all_purchases
    @purchases = current_user.purchases
    render 'purchases/all_purchases'
  end

  private

  def purchase_params
    params.require(:purchase).permit(:name, :amount, category_ids: [])
  end
end

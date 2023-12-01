class CategoriesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @categories = @user.categoriestabels
  end
end

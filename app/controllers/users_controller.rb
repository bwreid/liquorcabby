class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
  end

  def show
    @user = User.find( params[:id] )
    @cocktails = Cocktail.where( :created_by => @user.id )
  end
end



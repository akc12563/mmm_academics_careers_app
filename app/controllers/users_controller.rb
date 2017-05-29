class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @offers = Offer.where(:user=>@user.id)
    @internship = Offer.where(:user=>@user.id, :intern_fulltime => true, :status=>"1").first
    @fulltime = Offer.where(:user=>@user.id, :intern_fulltime => false, :status=>"1").first
  end
end

class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def show
    @user = User.find_by({id: params[:id]})
    if not @user
      raise ActiveRecord::RecordNotFound.new
    end
  end
  
end
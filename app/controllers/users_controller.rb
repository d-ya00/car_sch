class UsersController < ApplicationController
  def destroy
    sign_out
    redirect_to root_path, status: :see_other
  end
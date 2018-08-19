class Ajion2596dhi::UsersController < ApplicationController
  def index
    @users = User.all
  end
end

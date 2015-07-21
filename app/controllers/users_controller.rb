class UsersController < ApplicationController
  def index

  end

  def show
    @user  = User.find_by_username params[:id]
    @repos = []
    Github.new.
           repos.
           list(user: @user.username).
           each_page{|p|
             p.each{|r| @repos << r }
           }
  end
end

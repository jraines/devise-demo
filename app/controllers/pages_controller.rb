class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:investor_info]

  def index
    @pages = ['about', 'team']
  end

  def investor_info
    render text: 'go away'
  end

  def show
  end

  def about
  end

  def info
    redirect_to :about
  end

  def team
  end
end

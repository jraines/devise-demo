class PagesController < ApplicationController

  def index
  end

  def show
  end

  def about
  end

  def info
    redirect_to :about
  end
end

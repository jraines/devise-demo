require Rails.root + "lib/dribble_api"
class DribbleShotsController < ApplicationController

  def index
    @shots = DribbleApi.new.shots(:everyone)
  end
end

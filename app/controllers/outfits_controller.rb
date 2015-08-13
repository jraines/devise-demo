require Rails.root + 'lib/stylitics_wrapper'

class OutfitsController < ApplicationController

  def index
    @outfits = StyliticsWrapper.new.outfits(favorite: true)
  end

end

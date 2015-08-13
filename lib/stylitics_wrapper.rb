class StyliticsWrapper

  def outfits(opts={})
    outfits = Stylitics::Client.new.outfits
    filter_by_options(outfits, opts)
  end

  private

  def filter_by_options(outfits, options)
    outfits = filter_by_likes(outfits) if options[:likes]
    outfits = filter_by_favorite(outfits) if options[:favorite]
    outfits
  end

  def filter_by_likes(outfits)
    outfits.select{|o| o["like_count"] > 0 }
  end

  def filter_by_favorite(outfits)
    outfits.select{|o| o["favorite"] }
  end
end


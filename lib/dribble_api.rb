class DribbleApi
  class Shot
    class Player

      def twitter_screen_name
        @twitter_screen_name || "Not provided"
      end

      def initialize(player_hash)
        @twitter_screen_name = player_hash["twitter_screen_name"]
      end
    end

    attr_reader :title, :image_url, :player

    def initialize(shot_hash)
      @title = shot_hash["title"]
      @image_url = shot_hash["image_url"]
      @player = Player.new(shot_hash["player"])
    end

    def player_twitter_screen_name
      player.twitter_screen_name
    end
  end

  def initialize
    puts "I'm alive!"
  end

  #needs to return array
  def shots(group)
    uri = URI("http://api.dribbble.com/shots/#{group}")

    response        = Net::HTTP.get(uri)
    parsed_response = JSON.parse(response)

    parsed_response["shots"].map do |shot|
      Shot.new(shot)
    end
  end

end

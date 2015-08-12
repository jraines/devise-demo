class DribbleApi
  def initialize
    #just demonstrating that the
    #.new class method takes no args.
    #We don't actually have to write it.
    puts "I'm alive!"
  end

  #needs to return array
  def shots(group)
    uri = URI("http://api.dribbble.com/shots/#{group}")

    response        = Net::HTTP.get(uri)
    parsed_response = JSON.parse(response)

    parsed_response["shots"]
  end

end

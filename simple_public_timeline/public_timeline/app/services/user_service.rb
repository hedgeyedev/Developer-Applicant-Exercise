class UserService
  def conn
    Faraday.new(url: "http://localhost:3000")
  end
  
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def statuses(count)
    get_url("/1.1/statuses/status.json?count=#{count}")
  end
end
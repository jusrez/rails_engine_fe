class MerchantService

  def self.merchants
    response = conn.get("/api/v1/merchants")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.merchant(id)
    response = conn.get("/api/v1/merchants/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: 'http://localhost:3000')
  end
end
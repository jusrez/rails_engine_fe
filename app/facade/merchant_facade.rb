class MerchantFacade
  
  def self.merchants
    json = MerchantService.merchants
    json[:data].map do |merchant_data|
      MerchantObject.new(merchant_data)
    end
  end

  def self.merchant(id)
    json = MerchantService.merchant(id)
    json[:data].map do |merchant_data|
      MerchantObject.new(merchant_data)
    end
  end
end
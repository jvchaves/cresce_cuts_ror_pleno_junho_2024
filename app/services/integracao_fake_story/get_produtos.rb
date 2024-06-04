require 'httparty'

module IntegracaoFakeStory
  class GetProdutos
   def initialize
     @base_url = "https://fakestoreapi.com"
   end

   def execute
      response = HTTParty.get("#{@base_url}/products")
      JSON.parse(response.body)
   end
  end
end

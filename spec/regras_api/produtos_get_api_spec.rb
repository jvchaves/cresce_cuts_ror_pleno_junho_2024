require 'rails_helper'

RSpec.describe 'API INDEX', type: :request do
  describe 'GET /api/v1/produtos' do
    before do
      0..5.times do
        Produto.create(nome: 'Produto 1', descricao: 'Descrição do produto 1')
      end
    end


    it 'returns a successful response' do
      get '/api/v1/produtos'

      json_response = JSON.parse(response.body)
      
      expect(json_response.size).to eq(5)
      expect(response).to have_http_status(:success)
    end
  end
end

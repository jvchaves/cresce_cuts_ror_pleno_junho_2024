require 'rails_helper'

RSpec.describe Produto, type: :model do
  context 'validacoes Produto' do
    it 'Invalida' do
      produto = Produto.new(nome: '')

      expect(produto.valid?).to be_falsy
    end

    it 'Valida' do
      produto = Produto.new(nome: 'Produto 1')

      expect(produto.valid?).to be_truthy
    end
  end
end

require 'rails_helper'

RSpec.describe Desconto, type: :model do
  context 'validacoes Desconto' do
    it 'Invalida' do
      desconto = Desconto.new(nome: '')

      expect(desconto.valid?).to be_falsy
    end

    it 'Valida' do
      produto = Produto.new(nome: 'Produto 1')
      desconto = Desconto.new(nome: 'Desconto 1', tipo: "Leve + Pague -", ativacao: Time.now, produto: produto)

      expect(desconto.valid?).to be_truthy
    end
  end
end

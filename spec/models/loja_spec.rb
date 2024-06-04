require 'rails_helper'

RSpec.describe Loja, type: :model do
  context 'validacoes Loja' do
    it 'Invalida' do
      loja = Loja.new(nome: '')

      expect(loja.valid?).to be_falsy
    end

    it 'Valida' do
      loja = Loja.new(nome: 'Loja 1')

      expect(loja.valid?).to be_truthy
    end
  end
end

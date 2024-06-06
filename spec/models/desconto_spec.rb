require 'rails_helper'

RSpec.describe Desconto, type: :model do
  let(:produto) { Produto.create(nome: "Produto Teste") }

  context "validações de presença" do
    it "é válido com todos os campos preenchidos" do
      desconto = Desconto.new(
        nome: "Desconto Teste",
        tipo: "de_por",
        ativacao: Date.today,
        preco: 10.0,
        preco_de: 20.0,
        preco_por: 15.0,
        produto: produto
      )
      expect(desconto).to be_valid
    end

    it "não é válido sem nome" do
      desconto = Desconto.new(
        tipo: "de_por",
        ativacao: Date.today,
        preco: 10.0,
        preco_de: 20.0,
        preco_por: 15.0,
        produto: produto
      )
      expect(desconto).not_to be_valid
      expect(desconto.errors[:nome]).to include("Precisa ser preenchido")
    end

    it "não é válido sem tipo" do
      desconto = Desconto.new(
        nome: "Desconto Teste",
        ativacao: Date.today,
        preco: 10.0,
        produto: produto
      )
      expect(desconto).not_to be_valid
      expect(desconto.errors[:tipo]).to include("Precisa ser preenchido")
    end

    it "não é válido sem ativacao" do
      desconto = Desconto.new(
        nome: "Desconto Teste",
        tipo: "de_por",
        preco: 10.0,
        produto: produto
      )
      expect(desconto).not_to be_valid
      expect(desconto.errors[:ativacao]).to include("Precisa ser preenchido")
    end

    it "não é válido sem preco" do
      desconto = Desconto.new(
        nome: "Desconto Teste",
        tipo: "de_por",
        ativacao: Date.today,
        produto: produto
      )
      expect(desconto).not_to be_valid
      expect(desconto.errors[:preco]).to include("Precisa ser preenchido")
    end
  end

  context "Descontos do tipo DE-POR" do
    it "é válido com preço de e preço por" do
      desconto = Desconto.new(
        nome: "Desconto Teste",
        tipo: "de_por",
        ativacao: Date.today,
        preco: 10.0,
        preco_de: 20.0,
        preco_por: 15.0,
        produto: produto
      )
      expect(desconto).to be_valid
    end

    it "não é válido sem preço de" do
      desconto = Desconto.new(
        nome: "Desconto Teste",
        tipo: "de_por",
        ativacao: Date.today,
        preco: 10.0,
        preco_por: 15.0,
        produto: produto
      )
      expect(desconto).not_to be_valid
      expect(desconto.errors[:preco_de]).to include("Precisa ser preenchido")
    end

    it "não é válido sem preço por" do
      desconto = Desconto.new(
        nome: "Desconto Teste",
        tipo: "de_por",
        ativacao: Date.today,
        preco: 10.0,
        preco_de: 20.0,
        produto: produto
      )
      expect(desconto).not_to be_valid
      expect(desconto.errors[:preco_por]).to include("Precisa ser preenchido")
    end
  end
end

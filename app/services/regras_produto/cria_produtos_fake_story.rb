module RegrasProduto
  class CriaProdutosFakeStory
    def initialize
      @produtos = IntegracaoFakeStory::GetProdutos.new().execute
    end

    def execute
      @produtos.each do |produto|
        Produto.create(nome:produto["title"], descricao: produto["description"] )
      end
    end
  end
end
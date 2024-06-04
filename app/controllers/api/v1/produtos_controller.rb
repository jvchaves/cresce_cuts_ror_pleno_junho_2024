module Api
  module V1
    class ProdutosController < ApplicationController
      def index
        produtos = Produto.all
        render json: produtos
      end
    end
  end
end

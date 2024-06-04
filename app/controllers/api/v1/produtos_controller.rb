module Api
  module V1
    class ProdutosController < ApplicationController
      def index
        products = Produto.all
        render json: products
      end
    end
  end
end

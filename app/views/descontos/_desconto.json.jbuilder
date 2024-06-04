json.extract! desconto, :id, :nome, :descricao, :tipo, :status, :preco, :leve, :pague, :percentual_desconto, :preco_de, :preco_por, :ativacao, :inativacao, :created_at, :updated_at
json.url desconto_url(desconto, format: :json)

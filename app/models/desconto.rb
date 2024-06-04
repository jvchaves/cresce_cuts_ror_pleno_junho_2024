class Desconto < ApplicationRecord
  validates :nome, :tipo, :ativacao, presence: true
  belongs_to :produto
end

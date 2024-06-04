class Desconto < ApplicationRecord
  validates :nome, :tipo, :ativacao, presence: true
  belongs_to :produto

  enum tipo: { de_por: "DE / POR", leve_mais_pague_menos: "Leve + Pague -", percentual: "Percentual" }
end

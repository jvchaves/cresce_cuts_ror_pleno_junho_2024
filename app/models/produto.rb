class Produto < ApplicationRecord
  has_many :descontos
  validates :nome, presence: true
end

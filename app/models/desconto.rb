class Desconto < ApplicationRecord
  belongs_to :produto

  enum tipo: { de_por: "DE / POR", leve_mais_pague_menos: "Leve + Pague -", percentual: "Percentual" }

  validate on: :create do
    campos_obrigatorios_preenchidos?
	end

  private

  def campos_obrigatorios_preenchidos?
    errors.add(:nome, "Precisa ser preenchido") if nome.blank?
    errors.add(:tipo, "Precisa ser preenchido") if tipo.blank?
    errors.add(:ativacao, "Precisa ser preenchido") if ativacao.blank?
    errors.add(:preco, "Precisa ser preenchido") if preco.blank?
    errors.add(:base, "Desconto não é válido") if errors.any?
  end
end

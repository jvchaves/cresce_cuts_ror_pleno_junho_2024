class Desconto < ApplicationRecord
  belongs_to :produto

  has_paper_trail

  enum tipo: { de_por: "DE / POR", leve_mais_pague_menos: "Leve + Pague -", percentual: "Percentual" }

  validate on: :create do
    campos_obrigatorios_preenchidos?
    campos_obrigatorios_do_tipo?
	end

  private

  def campos_obrigatorios_preenchidos?
    errors.add(:nome, "Precisa ser preenchido") if nome.blank?
    errors.add(:tipo, "Precisa ser preenchido") if tipo.blank?
    errors.add(:ativacao, "Precisa ser preenchido") if ativacao.blank?
    errors.add(:produto, "Precisa ser preenchido") if produto.blank?
    errors.add(:status, "Precisa ser preenchido") if status.blank?
    errors.add(:inativacao, "Precisa ser preenchido") if inativacao.blank?
    errors.add(:preco, "Precisa ser preenchido") if preco.blank? and tipo == 'percentual'
    errors.add(:base, "Desconto não é válido") if errors.any?
  end

  def campos_obrigatorios_do_tipo?
    case tipo
    when "de_por"
      errors.add(:preco_de, "Precisa ser preenchido") if preco_de.blank?
      errors.add(:preco_por, "Precisa ser preenchido") if preco_por.blank?
    when "leve_mais_pague_menos"
      errors.add(:leve, "Precisa ser preenchido") if leve.blank?
      errors.add(:pague, "Precisa ser preenchido") if pague.blank?
    when "percentual"
      errors.add(:percentual_desconto, "Precisa ser preenchido") if percentual_desconto.blank?
    end
  end
end

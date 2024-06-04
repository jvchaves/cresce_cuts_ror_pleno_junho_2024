class CreateDescontos < ActiveRecord::Migration[7.0]
  def change
    create_table :descontos do |t|
      t.references :produto, null: false, foreign_key: true
      t.string :nome
      t.string :descricao
      t.string :tipo
      t.boolean :status
      t.decimal :preco
      t.integer :leve
      t.integer :pague
      t.decimal :percentual_desconto
      t.decimal :preco_de
      t.decimal :preco_por
      t.date :ativacao
      t.date :inativacao

      t.timestamps
    end
  end
end

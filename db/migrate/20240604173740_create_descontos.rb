class CreateDescontos < ActiveRecord::Migration[7.0]
  def change
    create_table :descontos do |t|
      t.string :nome
      t.string :descricao
      t.string :tipo
      t.boolean :status
      t.decimal :preco, precision: 10, scale: 2
      t.integer :leve
      t.integer :pague
      t.decimal :percentual_desconto, precision: 10, scale: 2
      t.decimal :preco_de, precision: 10, scale: 2
      t.decimal :preco_por, precision: 10, scale: 2
      t.date :ativacao
      t.date :inativacao

      t.timestamps
    end
  end
end

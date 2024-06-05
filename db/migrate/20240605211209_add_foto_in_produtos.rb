class AddFotoInProdutos < ActiveRecord::Migration[7.0]
  def change
    add_column :produtos, :foto, :string
  end
end

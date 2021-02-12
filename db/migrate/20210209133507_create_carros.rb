class CreateCarros < ActiveRecord::Migration[6.0]
  def change
    create_table :carros do |t|
      t.string :nome
      t.string :ano
      t.string :modelo

      t.timestamps
    end
  end
end

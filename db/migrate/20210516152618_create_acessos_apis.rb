class CreateAcessosApis < ActiveRecord::Migration[6.0]
  def change
    create_table :acessos_apis do |t|
      t.string :token
      t.string :url

      t.timestamps
    end
  end
end

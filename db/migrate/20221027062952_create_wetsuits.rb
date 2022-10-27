class CreateWetsuits < ActiveRecord::Migration[6.1]
  def change
    create_table :wetsuits do |t|
      t.string :name
      t.timestamps
    end
  end
end

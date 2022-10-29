class AddNameToArea < ActiveRecord::Migration[6.1]
  def change
    add_column :areas, :name, :string
  end
end

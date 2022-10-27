class RemoveAreaFromArea < ActiveRecord::Migration[6.1]
  def change
    remove_column :areas, :area, :string
  end
end

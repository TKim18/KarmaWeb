class AddNameToCircles < ActiveRecord::Migration[5.0]
  def change
    add_column :circles, :name, :string
  end
end

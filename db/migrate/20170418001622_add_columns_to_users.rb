class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :email, :string
    add_column :users, :fullName, :string
    add_column :users, :karmaPoints, :decimal
    add_column :users, :circleName, :string
    add_column :users, :homeLocation, :string
  end
end

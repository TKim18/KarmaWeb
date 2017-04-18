class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :circleName
      t.string :requestUserName
      t.string :acceptUserName
      t.string :category
      t.string :fromLocation
      t.string :toDestination
      t.boolean :instant
      t.datetime :preOrderTime
      t.decimal :cost

      t.timestamps
    end
  end
end

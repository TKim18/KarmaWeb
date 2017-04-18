class AddReferencesToOrder < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :circle, foreign_key: true
  end
end

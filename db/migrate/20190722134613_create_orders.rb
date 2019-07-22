class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :activity, foreign_key: true
      t.integer :number_of_tickets

      t.timestamps
    end
  end
end

class AddAttributesToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :status, :string
    add_monetize :orders, :amount, currency: { present: false }
    add_column :orders, :payment, :jsonb
  end
end

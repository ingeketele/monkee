class AddPriceToActivities < ActiveRecord::Migration[5.2]
  def change
    add_monetize :activities, :price, currency: { present: false }
  end
end

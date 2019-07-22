class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :title
      t.string :address
      t.datetime :date
      t.text :description
      t.integer :rating
      t.integer :capacity
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

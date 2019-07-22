class CreateActivityReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_reviews do |t|
      t.references :order, foreign_key: true
      t.text :comment
      t.integer :rating

      t.timestamps
    end
  end
end

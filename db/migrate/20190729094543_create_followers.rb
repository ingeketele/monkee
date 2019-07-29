class CreateFollowers < ActiveRecord::Migration[5.2]
  def change
    create_table :followers do |t|
      t.integer :count, default: 0, null: false
      t.integer :follower_id, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

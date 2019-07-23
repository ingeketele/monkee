class CreateActivityCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_categories do |t|

      t.references :activity, foreign_key: :true
      t.references :category, foreign_key: :true
      t.timestamps
    end
  end
end

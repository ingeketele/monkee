class CreateActivityImages < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_images do |t|
      t.references :activity, foreign_key: true
      t.string :photo

      t.timestamps
    end
  end
end

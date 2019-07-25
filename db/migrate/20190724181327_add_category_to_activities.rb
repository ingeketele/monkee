class AddCategoryToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :category, :string, null: false, default: ""
  end
end

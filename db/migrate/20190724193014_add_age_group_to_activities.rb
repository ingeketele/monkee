class AddAgeGroupToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :age_group, :string, null: false, default: ""
  end
end

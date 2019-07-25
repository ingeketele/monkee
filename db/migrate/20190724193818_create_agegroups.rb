class CreateAgegroups < ActiveRecord::Migration[5.2]
  def change
    create_table :agegroups do |t|

      t.timestamps
    end
  end
end

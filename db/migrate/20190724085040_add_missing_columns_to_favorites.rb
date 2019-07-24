class AddMissingColumnsToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_reference :favorites, :user, foreign_key: true
    add_reference :favorites, :activity, foreign_key: true
  end
end

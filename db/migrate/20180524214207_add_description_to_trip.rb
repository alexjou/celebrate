class AddDescriptionToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :description_md, :text
    add_column :trips, :description_short, :text
  end
end

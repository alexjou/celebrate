class AddPriceCentsToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :price_cents, :integer, default: 0
  end
end

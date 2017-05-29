class AddPriorLocationToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :prior_location, :string
  end
end

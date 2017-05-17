class AddSavedContactCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :saved_contacts_count, :integer
  end
end

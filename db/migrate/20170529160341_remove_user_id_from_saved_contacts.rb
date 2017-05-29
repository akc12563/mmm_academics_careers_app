class RemoveUserIdFromSavedContacts < ActiveRecord::Migration[5.0]
  def change
    remove_column :saved_contacts, :user_id, :integer
  end
end

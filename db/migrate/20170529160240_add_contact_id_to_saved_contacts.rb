class AddContactIdToSavedContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :saved_contacts, :contact_id, :integer
  end
end

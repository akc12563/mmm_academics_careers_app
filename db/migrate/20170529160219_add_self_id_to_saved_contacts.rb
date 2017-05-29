class AddSelfIdToSavedContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :saved_contacts, :self_id, :integer
  end
end

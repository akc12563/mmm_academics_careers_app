class AddCommentsToSavedContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :saved_contacts, :comments, :text_field
  end
end

class AddOkToContactToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :ok_to_contact, :boolean
  end
end

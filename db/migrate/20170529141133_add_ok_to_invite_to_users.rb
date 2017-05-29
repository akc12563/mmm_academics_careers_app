class AddOkToInviteToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :ok_to_invite, :boolean
  end
end

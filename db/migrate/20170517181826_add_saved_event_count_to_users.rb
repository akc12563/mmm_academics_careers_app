class AddSavedEventCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :saved_events_count, :integer
  end
end

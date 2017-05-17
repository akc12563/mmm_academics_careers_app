class AddSavedEventCountToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :saved_events_count, :integer
  end
end
